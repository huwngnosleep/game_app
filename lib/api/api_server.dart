import 'package:game_app/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    var url = Uri.parse("https://reqres.in/api/login");
    final response = await http.post(url, body: loginRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data!");
    }
  }
}
