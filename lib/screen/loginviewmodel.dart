import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutterapps/authmanager/auth_manager.dart';
import 'package:getxflutterapps/model/login_model.dart';
import 'package:getxflutterapps/service/loginservice.dart';

class LoginViewModel extends GetxController {
  late LoginService _loginService = LoginService();

  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
    super.onInit();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService.fetchLogin(
      LoginModel(
        email: email,
        password: password,
      ),
    );
    if (response != null) {
      _authManager.login(response.token);
    } else {
      Get.defaultDialog(
        title: 'Login Failed',
        middleText: 'Please check your credentials',
        textConfirm: 'Ok',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }
}
