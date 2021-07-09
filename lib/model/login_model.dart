class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel(this.token, this.error);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(json["token"] != null ? json["token"] : "",
        json["error"] != null ? json["error"] : "");
  }
}

class LoginRequestModel {
  String email;
  String password;
  LoginRequestModel({this.email = "aA", this.password = "aA"});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email.trim(),
      "password": password.trim()
    };

    return map;
  }
}
