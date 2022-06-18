part of 'page/pages.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _autManager = Get.find();
    return Obx(((){
      return _autManager.isLogged.value
          ? HomeScreen()
          : LoginScreen();
    }));
  }
}
