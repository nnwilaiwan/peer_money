import 'package:peer_money/models/appState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAction {
  final dynamic _token;

  dynamic get token => this._token;

  GetAction(
    this._token,
  );
}

ThunkAction<AppState> getLoginAction = (Store<AppState> store) async {
  final prefs = await SharedPreferences.getInstance();

  final String? token = prefs.getString('token');
  ;

  store.dispatch(GetAction(
    token,
  ));
};
