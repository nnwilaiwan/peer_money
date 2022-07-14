import 'package:flutter/material.dart';

// App State: View initialize the app state file
class AppState {
  final dynamic token;

  AppState({
    @required this.token,
  });

  factory AppState.initial() {
    return AppState(
      token: null,
    );
  }
}
