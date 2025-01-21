import 'package:flutter/material.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/models/constants/messages.dart';
import 'package:instoreapp/models/user_store.dart';

import 'package:instoreapp/models/user_credential.dart';
import 'package:instoreapp/services/user_store_service.dart';

class LoginService {
  final UserStoreService _userStoreService = UserStoreService();

  String _alertTitle = "";
  String _alertContent = "";
  String _alertBtn = OKAY_TR;
  bool _isAuth = true;
  int _increase = 0;
  String phone = "";
  int userCode = 0;

  final List<UserCredential> _usr = _user;

  Map<String, String> alertValues(TextEditingController userNameController,
      TextEditingController passwordController, int loginTryCount) {
    if (userNameController.text == "") {
      _alertTitle = WARNING_TR;

      _alertContent = USER_NAME_REQUIRED;

      _isAuth = false;
    } else if (passwordController.text == "") {
      _alertTitle = WARNING_TR;

      _alertContent = PASSWORD_REQUIRED;

      _isAuth = false;
    } else {
      for (final UserCredential usr in _usr) {
        phone = usr.phone!;
        userCode = usr.userCode!;
        if (usr.name == userNameController.text &&
            usr.password == passwordController.text) {
          _initAlert();
          phone = usr.phone!;
          break;
        } else if (usr.name == userNameController.text &&
            usr.password != passwordController.text) {
          _alertTitle = ERROR_TR;

          _alertContent = INVALID_CREDENTIAL;

          _isAuth = false;

          _increase = 1;
        } else if (usr.name != userNameController.text ||
            usr.password != passwordController.text) {
          _alertTitle = ERROR_TR;

          _alertContent = INVALID_CREDENTIAL;

          _isAuth = false;
        }
      }
    }

    if (loginTryCount >= 2) {
      _alertTitle = WARNING_TR;

      _alertContent = ACCOUNT_BLOCKED;
      _isAuth = false;
    }

    Map<String, String> val = {};
    val["title"] = _alertTitle;
    val["content"] = _alertContent;
    val["isAuth"] = _isAuth.toString();
    val["alertBtn"] = _alertBtn;
    val["increase"] = _increase.toString();
    val["phone"] = phone;
    val["userCode"] = userCode.toString();
    _initAlert();
    return val;
  }

  static get _user {
    return [
      const UserCredential(
        name: "user",
        password: "1234",
        token: "token",
        isRemembered: true,
        phone: "5050000000",
        userCode: 1,
        userName: "user",
      ),
      const UserCredential(
        name: "test",
        password: "1111",
        token: "123412341234asdfasdf-1234",
        phone: "0555551213",
        isRemembered: true,
        userCode: 2,
        userName: "test",
      ),
    ];
  }

  void _initAlert() {
    _alertTitle = "";

    _alertContent = "";

    _alertBtn = OKAY_TR;

    _isAuth = true;

    _increase = 0;
  }

  String maskPhone(String phone, int startIndex, int endIndex) {
    var startPart = phone.substring(0, startIndex);
    var endPart = phone.substring(endIndex);
    var maskedVal = "";
    for (int i = 0; i < endIndex - startIndex; i++) {
      maskedVal += "*";
    }
    return startPart + maskedVal + endPart;
  }

  List<UserStore> get storeList {
    return _userStoreService.storeList;
  }

  /* List<DropdownMenuItem<UserStore>> itemList(
      BuildContext context, int userCode) {
    List<DropdownMenuItem<UserStore>> itemList = [];
    itemList.addAll(storeList
        .where((UserStore usr) => usr.userCode == userCode)
        .toList()
        .map(
          (UserStore item) => DropdownMenuItem<UserStore>(
            value: item,
            child: Text(
              "${item.storeName} - ${item.subStoreName}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList());
    itemList.add(
      DropdownMenuItem(
        value: UserStore(),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const UserStoreAdd(),
              ),
            );
          },
          child: const Row(
            children: [
              Icon(Icons.add),
              Text(STORE_BUTTON_NEW),
            ],
          ),
        ),
      ),
    );
    return itemList;
  } */

  List<UserStore> getUserStore(BuildContext context, int userCode) {
    return storeList.where((UserStore us) => us.userCode == userCode).toList();
  }
}
