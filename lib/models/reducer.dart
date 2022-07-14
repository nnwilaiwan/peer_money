import 'package:peer_money/models/appState.dart';
import 'package:peer_money/models/getAction.dart';

AppState appReducer(state, action) {
  return AppState(
    //login
    token: loginReducerToken(state.token, action),
  );
}

//Login
loginReducerUsername(username, action) {
  if (action is GetAction) {
    return action.username;
  }
}

loginReducerPassword(password, action) {
  if (action is GetAction) {
    return action.password;
  }
}

loginReducerUserID(userID, action) {
  if (action is GetAction) {
    return action.userId;
  }
}

loginReducerRole(role, action) {
  if (action is GetAction) {
    return action.role;
  }
}

loginReducerEmployeetype(employeetype, action) {
  if (action is GetAction) {
    return action.employeetype;
  }
}

loginReducerEmployeeid(employeeid, action) {
  if (action is GetAction) {
    return action.employeeid;
  }
}

loginReducerEmployeename(employeename, action) {
  if (action is GetAction) {
    return action.employeename;
  }
}

loginReducerEmail(email, action) {
  if (action is GetAction) {
    return action.email;
  }
}

loginReducerToken(token, action) {
  if (action is GetAction) {
    return action.token;
  }
}

loginReducerImei(imei, action) {
  if (action is GetAction) {
    return action.imei;
  }
}

loginReducerBranchId(branchId, action) {
  if (action is GetAction) {
    return action.branchId;
  }
}

loginReducerBranchName(branchName, action) {
  if (action is GetAction) {
    return action.branchName;
  }
}

loginReducerCompanyId(companyId, action) {
  if (action is GetAction) {
    return action.companyId;
  }
}

loginReducerCompanyName(companyName, action) {
  if (action is GetAction) {
    return action.companyName;
  }
}
