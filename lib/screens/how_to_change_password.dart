import 'package:flutter/material.dart';
import 'package:instoreapp/widgets/app_bar/ing_app_bar.dart';

class HowToChangePassword extends StatelessWidget {
  const HowToChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const HowToChangePasswordPage();
  }
}

class HowToChangePasswordPage extends StatefulWidget {
  const HowToChangePasswordPage({super.key});

  @override
  State<HowToChangePasswordPage> createState() => _HowToChangePasswordPage();
}

class _HowToChangePasswordPage extends State<HowToChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: IngAppBar(
                leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black)),
                automaticallyImplyLeading: true,
                title: "Yardım ve İletişim",
                actions: null)
            .getAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'ING_Me',
                      color: Color.fromRGBO(51, 51, 51, 1)),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Şifremi nasıl değiştirebilirim? \n",
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'ING_Me',
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.bold,
                            height: 1.0)),
                    TextSpan(text: '\n'),
                    TextSpan(
                        text:
                            'Giriş şifrenizi değiştirmek için, uygulamaya giriş yaptıktan sonra ',
                        style: TextStyle(height: 1.3)),
                    TextSpan(
                        text: 'Profil ve Ayarlar > Şifre İşlemleri ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, height: 1.3)),
                    TextSpan(
                        text:
                            'adımına giderek mevcut şifrenizi girdikten sonra yeni şifrenizi belirleyebilirsiniz. ',
                        style: TextStyle(height: 1.3)),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                        text:
                            "Eğer şifrenizi unuttuysanız ve uygulamaya giriş yapamıyorsanız, ",
                        style: TextStyle(height: 1.3)),
                    TextSpan(
                        text: "0212 403 7777 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, height: 1.3)),
                    TextSpan(
                        text:
                            "numaralı İş Ortaklıkları Destek Servisi'ni arayarak şifre işlemlerinizi gerçekleştirebilirsiniz.",
                        style: TextStyle(height: 1.3))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
