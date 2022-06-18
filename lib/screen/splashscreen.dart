part of 'page/pages.dart';

class SplashScreen extends StatelessWidget {
  final AuthenticationManager _autManager = Get.put(AuthenticationManager());

  Future<void> initialize() async {
    _autManager.checkLoginStatus();
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return waitingView();
          } else {
            if (snapshot.hasError) {
              return errorView(snapshot);
            } else {
              return OnBoard();
            }
          }
        });
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot){
    return Scaffold(
      body: Center(
        child: Text('Error: ${snapshot.error}'),
      ),
    );
  }

  Scaffold waitingView() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
            Text('Loading Terus ...'),
          ],
        ),
      ),
    );
  }
}
