import 'package:get/get_connect/connect.dart';
import 'package:getxflutterapps/model/login_model.dart';
import 'package:getxflutterapps/model/loginresponsemodel.dart';

class LoginService extends GetConnect {
  String? loginUrl = 'https://reqres.in/api/login';

  Future<LoginResponseModel>? fetchLogin(LoginModel model) async {
    final response = await post(loginUrl, model.toJson());
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
