import 'package:flutter/material.dart';
import 'package:instoreapp/models/company_branch_model.dart';
import 'package:instoreapp/models/company_model.dart';
import 'package:instoreapp/models/constants/asset_path.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/models/constants/messages.dart';

class UserStoreAdd extends StatefulWidget {
  const UserStoreAdd({super.key});

  @override
  State<UserStoreAdd> createState() => _UserStoreAddState();
}

const ingColor = Color.fromRGBO(255, 98, 0, 1);

class _UserStoreAddState extends State<UserStoreAdd> {
  @override
  Widget build(BuildContext context) {
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
            "Mağaza Değiştir",
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
                STORE_ADD_COMPANY_SELECT_BODY,
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
              child: Text(STORE_ADD_COMPANY_SELECT),
            ),
            const SizedBox(
              height: 35,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                COMPANY_TR,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  /* void showModal(context, List<Widget> items) {
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
                        Text(items[index].storeName!),
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
  } */

  CompanyModel getDummydata() {
    CompanyBranchModel branchModel = const CompanyBranchModel(
      code: 1,
      name: "Adana",
    );
    CompanyBranchModel branchModel1 = const CompanyBranchModel(
      code: 2,
      name: "Malatya",
    );
    List<CompanyBranchModel> branchList = [branchModel1, branchModel];
    return CompanyModel(code: 1, name: "Teknosa", branchNames: branchList);
  }
}
