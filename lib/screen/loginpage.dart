part of 'page/pages.dart';

enum FormType { login, register }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final LoginViewModel _viewModel = Get.put(LoginViewModel());
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FormType _formType = FormType.login;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //validator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _formType == FormType.login ? _loginForm() : _registerForm(),
      ),
    );
  }

  Form _loginForm() {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailCtr,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.person),
              ),
              onChanged: (value) => emailCtr,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              validator: (value) => value!.length < 6
                  ? 'Password must be at least 6 characters'
                  : null,
              controller: passwordCtr,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _toggle,
                ),
                icon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: const Icon(Icons.lock)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: const Size.fromHeight(50.0),
                textStyle: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //    SnackBar(
                  //     content:  Text('Processing Data'),
                  //   ),
                  // );
                  await _viewModel.loginUser(
                    emailCtr.text,
                    passwordCtr.text,
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ));
  }

  Form _registerForm() {
    return Form(
        child: Column(
      children: [],
    ));
  }
}
