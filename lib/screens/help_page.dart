import 'package:flutter/material.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/screens/hot_to_create_new_user.dart';
import 'package:instoreapp/screens/how_to_activate_account.dart';
import 'package:instoreapp/screens/how_to_change_password.dart';
import 'package:instoreapp/screens/how_to_update_user_info.dart';
import 'package:instoreapp/widgets/app_bar/ing_app_bar.dart';
import 'package:instoreapp/widgets/custom_card/custom_card_with_header.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    IngAppBar appBar = IngAppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      automaticallyImplyLeading: true,
      title: "Yardım ve İletişim",
    );

    Widget businessPartnershipsSupportServiceHeader =
        const CustomCardWithHeader(
      header: "İş Ortaklıkları Destek Servisi",
      subtitle: null,
    );
    Widget faqHeader = const CustomCardWithHeader(
      header: "Sıkça Sorulan Sorular",
      subtitle: null,
    );

    ExpansionTile mailTile = ExpansionTile(
      leading: const Icon(Icons.mail, color: ING_ORANGE_COLOR),
      title: const Text(
        "E-posta Adresleri",
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'ING_Me',
            color: Color.fromRGBO(51, 51, 51, 1),
            fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "iods@ing.com.tr\nbayidestek@ing.com.tr",
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'ING_Me',
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(105, 105, 105, 1)),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      childrenPadding: const EdgeInsets.only(top: 5, left: 0, bottom: 9),
      trailing: const Icon(Icons.arrow_forward_ios),
      expandedAlignment: Alignment.topLeft,
      children: [
        GestureDetector(
            onTap: () async {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'iods@ing.com.tr',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'Destek Talebi',
                  'body': 'Merhabalar, '
                }),
              );
              if (await launchUrl(emailLaunchUri)) {
                launchUrl(emailLaunchUri);
              } else {
                throw Exception("E-posta gonderilemedi! $emailLaunchUri");
              }
            },
            child: const ListTile(
              leading: Icon(Icons.arrow_forward_ios),
              title: Text("Destek talebiniz için buraya dokunun.",
                  style: TextStyle(
                    fontFamily: 'ING_Me',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  )),
              subtitle: Text("iods@ing.com.tr",
                  style: TextStyle(
                      fontFamily: 'ING_Me',
                      fontSize: 14,
                      color: Color.fromRGBO(112, 112, 112, 1))),
            )),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Color.fromRGBO(217, 217, 217, 1),
        ),
        GestureDetector(
            onTap: () async {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'bayidestek@ing.com.tr',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'Öneri/Şikayet',
                  'body': 'Merhabalar, '
                }),
              );
              if (await launchUrl(emailLaunchUri)) {
                launchUrl(emailLaunchUri);
              } else {
                throw Exception("E-posta gonderilemedi! $emailLaunchUri");
              }
            },
            child: const ListTile(
              leading: Icon(Icons.arrow_forward_ios),
              title: Text("Öneri veya şikayetler için buraya dokunun.",
                  style: TextStyle(
                    fontFamily: 'ING_Me',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  )),
              subtitle: Text("bayidestek@ing.com.tr",
                  style: TextStyle(
                      fontFamily: 'ING_Me',
                      fontSize: 14,
                      color: Color.fromRGBO(112, 112, 112, 1))),
            )),
      ],
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: appBar.getAppBar(),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        businessPartnershipsSupportServiceHeader, // İş Ortaklıkları Destek Servisi
        ListTile(
          // Telefon
          leading: const Icon(
            Icons.phone,
            color: ING_ORANGE_COLOR,
          ),
          title: const Text("Telefon",
              style: TextStyle(
                fontFamily: 'ING_Me',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(51, 51, 51, 1),
              )),
          subtitle: const Text("+90 (212) 403 7777",
              style: TextStyle(
                  fontFamily: 'ING_Me',
                  fontSize: 16,
                  color: Color.fromRGBO(112, 112, 112, 1))),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () async {
            final Uri phoneUri = Uri(
              scheme: 'tel',
              path: "+902124037777",
            );
            if (await canLaunchUrl(phoneUri)) {
              launchUrl(phoneUri);
            } else {
              throw Exception("Arama yapilamadi! $phoneUri");
            }
          },
          tileColor: Colors.white,
        ),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 55,
          endIndent: 0,
          color: Color.fromRGBO(217, 217, 217, 1),
        ),
        mailTile,
        const SizedBox(height: 20),
        Column(
          children: [
            faqHeader,
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text("Yeni kullanıcı nasıl oluşturabilirim?",
                  style: TextStyle(
                    fontFamily: 'ING_Me',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  )),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HowToCreateNewUser()),
                );
              },
            ),
            const Divider(
              height: 0,
              thickness: 1,
              indent: 15,
              endIndent: 0,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
            ListTile(
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text("Şifremi nasıl değiştirebilirim?",
                    style: TextStyle(
                      fontFamily: 'ING_Me',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    )),
                tileColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HowToChangePassword()),
                  );
                }),
            const Divider(
              height: 0,
              thickness: 1,
              indent: 15,
              endIndent: 0,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
            ListTile(
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text("Hesabımı nasıl aktive edebilirim?",
                    style: TextStyle(
                      fontFamily: 'ING_Me',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    )),
                tileColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HowToActivateAccount()),
                  );
                }),
            const Divider(
              height: 0,
              thickness: 1,
              indent: 15,
              endIndent: 0,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
            ListTile(
                trailing: const Icon(Icons.arrow_forward_ios),
                title:
                    const Text("Kullanıcı bilgilerimi nasıl güncelleyebilirim?",
                        style: TextStyle(
                          fontFamily: 'ING_Me',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        )),
                tileColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HowToUpdateUserInfo()),
                  );
                }),
          ],
        ),
      ]),
    );
  }
}
