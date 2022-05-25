import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_auth/HomeScreen.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerSubmit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text,
      );
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  loginSubmit() async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://www.kibrispdr.org/dwn/8/background-tumblr-pastel.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Hello Again!',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Welcome back you\'ve been missed!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 24),
                        _buildTextField(
                          hintText: 'Enter email',
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          hintText: 'Enter password',
                          isPasswordField: true,
                        ),
                        const SizedBox(height: 24),
                        const MyButton(
                          text: 'Sign In',
                        ),
                        const SizedBox(height: 8),
                        const MyButton(
                          text: 'Register',
                          isPrimary: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextField _buildTextField({
    required String hintText,
    bool isPasswordField = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white70,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.grey,
            ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final bool isPrimary;

  const MyButton({
    Key? key,
    required this.text,
    this.isPrimary = true,
  }) : super(key: key);

  final _btnPrimaryColor = const Color(0xFFee776c);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isPrimary ? _btnPrimaryColor : Colors.white,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 46),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: isPrimary ? Colors.white : _btnPrimaryColor,
            ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Padding(
//       padding: const EdgeInsets.all(10),
//       child: ListView(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.only(top: 40),
//             child: const Text(
//               "Hello Everyone, Please Login!",
//               style: TextStyle(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 30),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Image.asset(
//               "images/logo_flutter.png",
//               height: 100,
//               width: 100,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), labelText: "Usename"),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), labelText: "Password"),
//             ),
//           ),
//           TextButton(onPressed: () {}, child: const Text("Forgot Password")),
//           Container(
//             height: 50,
//             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: ElevatedButton(
//               style: raisedButtonStyle,
//               child: const Text('Register'),
//               onPressed: () {
//                 registerSubmit();
//               },
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 50,
//             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: ElevatedButton(
//               style: raisedButtonStyle,
//               child: const Text("Login"),
//               onPressed: () {
//                 loginSubmit();
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.grey[300],
    primary: Colors.blue[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ));
