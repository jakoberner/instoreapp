import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/models/constants/messages.dart';
import 'package:instoreapp/models/user_store.dart';
import 'package:instoreapp/screens/user_store_add.dart';
import 'package:instoreapp/screens/user_store_view.dart';
import 'package:instoreapp/services/otp_service.dart';
import 'package:instoreapp/widgets/buttons/login_continiue_button.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class LoginOtpPage extends StatefulWidget {
  const LoginOtpPage({
    super.key,
    required this.phone,
    required this.userStores,
  });
  final String? phone;
  final List<UserStore>? userStores;

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  final CountdownController controller = CountdownController(autoStart: true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int seconds = 5;
    List<UserStore> userStoreList = widget.userStores!;
    String phone = widget.phone!;
    double width = MediaQuery.of(context).size.width * 0.98;

    TextEditingController otp = TextEditingController();

    const borderColor = Color.fromRGBO(255, 98, 0, 1);
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(51, 51, 51, 1),
      ),
      decoration: BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 221, 218, 217),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Column(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: borderColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      LOGIN_TR,
                      style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$phone $OTP_LOGIN",
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(105, 105, 105, 1)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Pinput(
                      length: 4,
                      pinAnimationType: PinAnimationType.slide,
                      autofocus: true,
                      controller: otp,
                      focusNode: FocusNode(),
                      defaultPinTheme: defaultPinTheme,
                      showCursor: true,
                      cursor: cursor,
                      preFilledWidget: preFilledWidget,
                      closeKeyboardWhenCompleted: false,
                      onCompleted: (value) {
                        bool resp = OtpService.validateOtp(otp.text, context);
                        resp ? checkAndRoutePage(userStoreList) : null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Countdown(
                      seconds: seconds,
                      controller: controller,
                      build: (BuildContext context, double time) {
                        if (time == 0) {
                          return TextButton(
                            onPressed: () {
                              controller.restart();
                            },
                            child: const Text(
                              "Tekrar Gönder",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueGrey),
                            ),
                          );
                        } else {
                          return Text(
                            "00:${time.toInt().toString().length == 2 ? time.toInt().toString() : "0${time.toInt()}"}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          );
                        }
                      },
                      interval: const Duration(
                        seconds: 1,
                      ),
                      onFinished: () {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginContiniueButton(
                      text: CONTINIUE_TR,
                      onPressed: () {
                        bool isValid =
                            OtpService.validateOtp(otp.text, context);
                        if (!isValid) {
                          null;
                        } else {
                          checkAndRoutePage(userStoreList);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkAndRoutePage(List<UserStore> userStoreList) {
    bool isStoreListEmpty =
        userStoreList.where((UserStore item) => item.userName != null).isEmpty;
    if (isStoreListEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const UserStoreAdd(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => UserStoreView(
            userStoreList: userStoreList,
          ),
        ),
      );
    }
  }
}
