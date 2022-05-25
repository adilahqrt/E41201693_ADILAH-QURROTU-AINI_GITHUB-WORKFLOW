import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_auth/LoginScreen.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 256,
              ),
              const SizedBox(height: 16),
              Text(
                'Hey Welcome!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lorem Ipsum',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 16),
              const MyButton(text: 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     if (auth.currentUser != null) {
//       print(auth.currentUser!.email);
//     }
//     return Scaffold(
//       body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 60),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.notifications),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.extension),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 37),
//               Text.rich(
//                 TextSpan(children: <TextSpan>[
//                   TextSpan(
//                     text: "Welcome, \n",
//                     style: TextStyle(color: Colors.blue[300]),
//                   ),
//                   TextSpan(
//                     text: auth.currentUser!.email,
//                     style: TextStyle(color: Colors.blue[900]),
//                   ),
//                 ]),
//                 style: const TextStyle(fontSize: 30),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.search, size: 18),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'Search'),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Recomended Place",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//               ),
//               Container(
//                 child: ElevatedButton(
//                     onPressed: () {
//                       _signOut().then((value) => Navigator.of(context)
//                           .pushReplacement(MaterialPageRoute(
//                               builder: (context) => const LoginScreen())));
//                     },
//                     child: const Text('Logout')),
//               ),
//             ],
//           )),
//     );
//   }
// }

//final countries = ["Tokyo", "Berlin", "Roma", "Monas"];
