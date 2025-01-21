import 'package:flutter/material.dart';
import 'package:instoreapp/models/constants/asset_path.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/models/constants/messages.dart';
import 'package:instoreapp/models/user_store.dart';
import 'package:instoreapp/screens/main_page.dart';
import 'package:instoreapp/screens/user_store_add.dart';
import 'package:instoreapp/widgets/buttons/login_continiue_button.dart';

class UserStoreView extends StatefulWidget {
  const UserStoreView({
    super.key,
    required this.userStoreList,
  });
  final List<UserStore>? userStoreList;

  @override
  State<UserStoreView> createState() => _UserStoreViewState();
}

class _UserStoreViewState extends State<UserStoreView> {
  UserStore selectedValue = UserStore();
  @override
  Widget build(BuildContext context) {
    const ingColor = Color.fromRGBO(255, 98, 0, 1);
    List<UserStore> storeList = widget.userStoreList!;
    if (storeList.where((UserStore item) => item.userName != null).length ==
        1) {
      setState(() {
        selectedValue = storeList[0];
      });
    }

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
                color: ingColor,
              ),
            ),
          ],
        ),
        title: const Center(
          child: Text(
            STORE_CHANGE_BAR_TITLE,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        actions: const [
          SizedBox(
            width: 100,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Divider(
              color: Colors.black12,
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              STORE_SELECT_PATH,
              width: 80,
              height: 80,
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                STORE_SELECT_HEADER,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                STORE_SELECT_BODY,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mağaza",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => showModal(context, storeList),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Text(
                        (selectedValue.storeName == null
                            ? "Mağaza Seçimi"
                            : ("${selectedValue.storeName!} - ${selectedValue.subStoreName!}")),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFF212121),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            LoginContiniueButton(
              text: CONTINIUE_TR,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showModal(context, List<UserStore> items) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(18),
            height: 200,
            alignment: Alignment.center,
            child: ListView.separated(
                itemCount: items.length + 1,
                separatorBuilder: (context, _) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return Builder(builder: (context) {
                    if (index <= items.length - 1) {
                      return GestureDetector(
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(items[index].storeName!),
                                const Text(" - "),
                                Text(items[index].subStoreName!),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedValue = items[index];
                            });
                            Navigator.of(context).pop();
                          });
                    } else {
                      return TextButton(
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 35,
                              color: Color.fromARGB(255, 2, 38, 67),
                            ),
                            Text(
                              "Yeni Mağaza Ekle",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 38, 67)),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const UserStoreAdd(),
                            ),
                          );
                        },
                      );
                    }
                  });
                }),
          );
        });
  }
}
