import 'package:flutter/material.dart';

// App State: View initialize the app state file
class AppState {
  final dynamic username;
  final dynamic password;
  final dynamic userID;
  final dynamic role;
  final dynamic employeetype;
  final dynamic employeeid;
  final dynamic employeename;
  final dynamic email;
  final dynamic token;
  final dynamic imei;
  final dynamic branchId;
  final dynamic branchName;
  final dynamic companyId;
  final dynamic companyName;
  AppState(
      {@required this.username,
      this.password,
      this.userID,
      this.role,
      this.employeetype,
      this.employeeid,
      this.employeename,
      this.email,
      this.token,
      this.imei,
      this.branchId,
      this.branchName,
      this.companyId,
      this.companyName});

  factory AppState.initial() {
    return AppState(
        username: null,
        password: null,
        userID: null,
        role: null,
        employeetype: null,
        employeeid: null,
        employeename: null,
        email: null,
        token: null,
        imei: null,
        branchId: null,
        branchName: null,
        companyId: null,
        companyName: null);
  }
}
