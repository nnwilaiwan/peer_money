//import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peer_money/models/appState.dart';

class APIController {
  Future<http.Response?> getRequestJson(Uri url) async {
    //encode Map to JSON
    var client =  http.Client();
    try {
      var response = await client.get(url);
      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postRequestJson(Uri url, Map data) async {
    //encode Map to JSON
    var body = json.encode(data);
    var client =  http.Client();
    try {
      var response = await client.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> getRequestFromJson(Uri url) async {
    var client =  http.Client();
    try {
      var response = await client.get(url);

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> getRequestTokenFromJson(
      Uri url, AppState state) async {
    var client =  http.Client();
    try {
      var response = await client
          .get(url, headers: {'authorization': 'Bearer ' + state.token});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postRequestFromJson(Uri url, dynamic data) async {
    var client =  http.Client();
    try {
      var response = await client.post(url, body: data);

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postRequestTokenFromJson(
      Uri url, dynamic data, AppState state) async {
    var client =  http.Client();
    try {
      var response = await client.post(url,
          body: data, headers: {'authorization': 'Bearer ' + state.token});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> getRequestToken(Uri url, AppState state) async {
    //encode Map to JSON

    var client =  http.Client();
    try {
      var response =
          await client.get(url, headers: {'authorization': 'Bearer ' + state.token});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postRequestToken(Uri url, AppState state) async {
    //encode Map to JSON

    var client =  http.Client();
    try {
      var response = await client
          .post(url, headers: {'authorization': 'Bearer ' + state.token});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> getToken(Uri url, String token) async {
    //encode Map to JSON

    var client =  http.Client();
    try {
      var response =
          await client.get(url, headers: {'authorization': 'Bearer $token'});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postToken(Uri url, String token) async {
    //encode Map to JSON

    var client =  http.Client();
    try {
      var response =
          await client.post(url, headers: {'authorization': 'Bearer $token'});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

    Future<http.Response?> postRequestTokenFromJsonII(
      Uri url, dynamic data, String token) async {
    var client =  http.Client();
    try {
      var response = await client.post(url,
          body: data, headers: {'authorization': 'Bearer $token'});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  APIController();
}
