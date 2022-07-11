import 'package:peer_money/models/appState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAction {
  final dynamic _username;
  final dynamic _password;
  final dynamic _userId;
  final dynamic _role;
  final dynamic _employeetype;
  final dynamic _employeeid;
  final dynamic _employeename;
  final dynamic _email;
  final dynamic _token;
  final dynamic _imei;
  final dynamic _branchId;
  final dynamic _branchName;
  final dynamic _companyId;
  final dynamic _companyName;

  dynamic get username => this._username;
  dynamic get password => this._password;
  dynamic get userId => this._userId;
  dynamic get role => this._role;
  dynamic get employeetype => this._employeetype;
  dynamic get employeeid => this._employeeid;
  dynamic get employeename => this._employeename;
  dynamic get email => this._email;
  dynamic get token => this._token;
  dynamic get imei => this._imei;
  dynamic get branchId => this._branchId;
  dynamic get branchName => this._branchName;
  dynamic get companyId => this._companyId;
  dynamic get companyName => this._companyName;

  GetAction(
      this._username,
      this._password,
      this._userId,
      this._role,
      this._employeetype,
      this._employeeid,
      this._employeename,
      this._email,
      this._token,
      this._imei,
      this._branchId,
      this._branchName,
      this._companyId,
      this._companyName);
}

ThunkAction<AppState> getLoginAction = (Store<AppState> store) async {
  final prefs = await SharedPreferences.getInstance();
  final String? username = prefs.getString('username');
  final String? password = prefs.getString('password');
  final String? userId = prefs.getString('userid');
  final String? role = prefs.getString('role');
  final String? employeetype = prefs.getString('employeetype');
  final String? employeeid = prefs.getString('employeeid');
  final String? employeename = prefs.getString('employeename');
  final String? email = prefs.getString('email');
  final String? token = prefs.getString('token');
  final String? imei = prefs.getString('imei');
  final String? branchId = prefs.getString('branchId');
  final String? branchName = prefs.getString('branchName');
  final String? companyId = prefs.getString('companyId');
  final String? companyName = prefs.getString('companyName');

  store.dispatch(GetAction(
      username,
      password,
      userId,
      role,
      employeetype,
      employeeid,
      employeename,
      email,
      token,
      imei,
      branchId,
      branchName,
      companyId,
      companyName));
};
