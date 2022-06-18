import 'package:get/get.dart';
// import 'package:get_state_manager/get_state_manager.dart';
import 'package:getxflutterapps/authmanager/cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  void logout() {
    isLogged.value = false;
    clearToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus(){
    final token = getToken();
    if(token != null){
      login(token);
    }
  }

}
