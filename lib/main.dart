// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
//
//
// import 'firebase_options.dart';
// import 'login.dart';
// import 'mainhome.dart';
// import 'signup.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//        home: login(),
//       // home:signup(),
//     );
//   }
// }

import 'package:exam/pages/home.dart';
import 'package:exam/pages/search.dart';
import 'package:exam/pages/update.dart';
import 'package:flutter/material.dart';
import 'package:exam/pages/home_page.dart';
import 'package:exam/pages/history.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // home: HomePage(),
      //  home: History(),
      //home:update(),
        //home:Search(),
       home:RecipeHome(),


      theme: ThemeData(
          // brightness: Brightness.dark,
          fontFamily: 'SixtyFour',
          // scaffoldBackgroundColor: Colors.grey.shade900,
          primaryColor: Colors.grey.shade900
      ),
    );
  }
}