class UserCredential {
  const UserCredential(
      {required this.name,
      required this.password,
      required this.token,
      required this.isRemembered,
      this.phone,
      this.userCode,
      this.userName});

  final String name;

  final String password;

  final String token;

  final bool isRemembered;

  final String? phone;

  final int? userCode;

  final String? userName;

  String get username {
    return name;
  }

  String get userPassword {
    return password;
  }

  String get userToken {
    return token;
  }

  bool get remembered {
    return isRemembered;
  }

  factory UserCredential.fromJson(Map<String, dynamic> parsedJson) {
    return UserCredential(
        name: parsedJson['name'] ?? "",
        password: parsedJson['password'] ?? "",
        token: parsedJson['token'] ?? "",
        isRemembered: parsedJson['isRemembered'] ?? "");
  }
}
