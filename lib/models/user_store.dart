class UserStore {
  int? storeCode;
  String? storeName;
  String? subStoreName;
  int? userCode;
  String? userName;
  //...

  UserStore({this.storeCode, this.storeName, this.subStoreName, this.userCode, this.userName});
  @override
  bool operator ==(Object other) {
    return other is UserStore && storeCode == other.storeCode;
  }

  @override
  int get hashCode =>
      storeCode!.hashCode ^ storeName!.hashCode ^ subStoreName.hashCode;
}
