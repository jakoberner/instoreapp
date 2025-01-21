import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instoreapp/models/constants/asset_path.dart';
import 'package:instoreapp/models/enums/user_enum.dart';
import 'package:instoreapp/models/user_store.dart';
import 'package:instoreapp/screens/help_page.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/services/login_service.dart';
import 'package:instoreapp/screens/login_otp_page.dart';
import 'package:instoreapp/widgets/buttons/login_continiue_button.dart';
import 'package:instoreapp/widgets/modals/error_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _loginService = LoginService();

  UserStore? selectedValue;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRemembered = false;
  int loginTryCount = 0;

  Future<void> _getCredentail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString(USER_CREDENTIAL);
    Map<String, dynamic> userMap;
    if (userPref != null) {
      userMap = jsonDecode(userPref) as Map<String, dynamic>;
      if (userMap[UserEnum.isRemembered.name] == true) {
        setState(() {
          userNameController.text = userMap[UserEnum.userName.name];
          isRemembered = userMap[UserEnum.isRemembered.name];
        });
      }
    }
  }

  Future<void> _setRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isRemembered == true) {
      Map<String, dynamic> user = {
        UserEnum.userName.name: userNameController.text,
        UserEnum.isRemembered.name: isRemembered
      };
      await prefs.setString(USER_CREDENTIAL, jsonEncode(user));
    } else {
      await prefs.remove(USER_CREDENTIAL);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCredentail();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        title: Center(
          child: Image.asset(
            LOGO_PATH,
            width: 24,
            height: 24,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HelpPage()));
            },
            child: const Text(
              HELP_TR,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(
              color: Colors.black12,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    UserEnum.userName.label,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                  TextField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Şifre",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(UserEnum.isRemembered.label),
                      Switch(
                        value: isRemembered,
                        onChanged: (value) {
                          setState(() {
                            isRemembered = value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  LoginContiniueButton(text: LOGIN_TR, onPressed: _login),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  _login() {
    Map<String, String> alertValues = _loginService.alertValues(
        userNameController, passwordController, loginTryCount);

    if (alertValues["isAuth"] == "false") {
      setState(() {
        loginTryCount = loginTryCount + int.parse(alertValues["increase"]!);
      });

      ErrorDialog.openDialog(context, alertValues["title"]!,
          alertValues["content"]!, alertValues["alertBtn"]!);
    } else {
      _setRememberMe();
      setState(() {
        loginTryCount = 0;
      });
      List<UserStore> itemList = _loginService.getUserStore(
          context, int.parse(alertValues["userCode"]!));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            // eğer otp yapılmışsa otp ekranı pas geçilecek
            return LoginOtpPage(
              phone: _loginService.maskPhone(alertValues["phone"]!, 3, 8),
              userStores: itemList,
            );
          },
        ),
      );
    }
  }
}
