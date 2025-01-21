import 'package:instoreapp/models/user_store.dart';

class UserStoreService {
  List<UserStore> get storeList {
    return [
      UserStore(
          storeCode: 1,
          storeName: "Teknosa",
          subStoreName: "Ataşehir",
          userCode: 2,
          userName: "user"),
      UserStore(
          storeCode: 2,
          storeName: "Teknosa",
          subStoreName: "Ümraniye",
          userCode: 2,
          userName: "user"),
      UserStore(
          storeCode: 3,
          storeName: "Teknosa",
          subStoreName: "Maslak",
          userCode: 2,
          userName: "test"),
      UserStore(
          storeCode: 4,
          storeName: "Teknosa",
          subStoreName: "Sarıyer",
          userCode: 2,
          userName: "test"),
    ];
  }

  List<UserStore> add(UserStore userStore) {
    int lastIndex = storeList.length;
    userStore.storeCode = lastIndex;
    storeList.add(userStore);
    return storeList;
  }
}
