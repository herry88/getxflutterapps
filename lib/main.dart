part of 'screen/page/pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX',
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => LoginScreen(),
      //   ),
      //   // GetPage(
      //   //   name: '/start',
      //   //   page: () => StartScreen(),
      //   // ),
      // ],
      home: SplashScreen(),
    );
  }
}