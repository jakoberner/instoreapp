import 'package:flutter/material.dart';
import 'package:instoreapp/widgets/app_bar/ing_app_bar.dart';

class HowToCreateNewUser extends StatelessWidget {
  const HowToCreateNewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const HowToCreateNewUserPage();
  }
}

class HowToCreateNewUserPage extends StatefulWidget {
  const HowToCreateNewUserPage({super.key});

  @override
  State<HowToCreateNewUserPage> createState() => _HowToCreateNewUserPage();
}

class _HowToCreateNewUserPage extends State<HowToCreateNewUserPage> {
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
                      color: Color.fromRGBO(51, 51, 51, 1),
                      height: 1.5),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Yeni kullanıcı nasıl oluşturabilirim? \n",
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'ING_Me',
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontWeight: FontWeight.bold,
                            height: 1.0)),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'ING_Me',
                          color: Color.fromRGBO(51, 51, 51, 1),
                          height: 1.3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
