enum UserEnum {
  userName(uiLabel: "Kullanıcı Adı"),

  password(uiLabel: "Şifre"),

  token(uiLabel: "Token"),

  isRemembered(uiLabel: "Beni Hatırla");

  final String uiLabel;

  const UserEnum({required this.uiLabel});

  String get label => uiLabel;
}
