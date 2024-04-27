// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'Home.dart';
//
//
// class login extends StatelessWidget {
//   login({super.key});
//   TextEditingController usercontroller = TextEditingController();
//
//   TextEditingController passcontroller= TextEditingController();
//
//
//   Future<void> loginAccount(String emailAddress,String password,var context) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailAddress,
//           password: password
//       );
//       print(credential);
//       usercontroller.clear();
//       passcontroller.clear();
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return Home();
//       },));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage('https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHdoaXRlJTIwJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D',
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//
//               SizedBox(height: 150),
//               Column(
//                 children: [
//                   // Text('SIGN UP'),
//                   Text(
//                     'LOGIN HERE',
//                     style: TextStyle(fontWeight:FontWeight.w600,
//                       fontSize: 20, // Set the desired font size
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//
//
//                 ],
//               ),
//               TextField(
//                 controller: usercontroller,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passcontroller,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       loginAccount(usercontroller.text, passcontroller.text, context);
//                     },
//                     child: Text('Login'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//
//                 ],
//
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Home.dart';
//
// class login extends StatefulWidget {
//   login({Key? key,});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   TextEditingController userController = TextEditingController();
//
//   TextEditingController passController = TextEditingController();
//
//   Future<void> loginAccount(
//       String emailAddress, String password, BuildContext context) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailAddress,
//         password: password,
//       );
//
//
//
//       setData(String text1,String text2)async{
//         SharedPreferences pref = await SharedPreferences.getInstance();
//         pref.setString('password', text1);
//         pref.setString('emailAddress', text2);
//       }
//
//       print(credential);
//       userController.clear();
//       passController.clear();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Home()),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                 'https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHdoaXRlJTIwJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D',
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 150),
//               Column(
//                 children: [
//                   Text(
//                     'LOGIN HERE',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//               TextField(
//                 controller: userController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//
//                   ElevatedButton(
//                     onPressed: () async {
//                       await loginAccount(
//                         userController.text,
//                         passController.text,
//                         context,
//                       );
//                       setData(userController.text,passController.text);
//
//                       // After login is successful, navigate to Home page and pass username and password
//                       Navigator.push(context, MaterialPageRoute(
//                         builder: (context) {
//                           return Home();
//                         },
//                       ),
//
//                       );
//                     },
//                     child: Text('Login'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//
//
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Home.dart';
//
// class login extends StatefulWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<login> {
//   TextEditingController userController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//
//   Future<void> loginAccount(
//       String emailAddress, String password, BuildContext context) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailAddress,
//         password: password,
//       );
//
//       // Save user credentials to SharedPreferences
//       await setData(emailAddress, password);
//
//       print(credential);
//       userController.clear();
//       passController.clear();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Home()),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
//
//   Future<void> setData(String email, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('email', email);
//     prefs.setString('password', password);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                 'https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHdoaXRlJTIwJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D',
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 150),
//               Column(
//                 children: [
//                   Text(
//                     'LOGIN HERE',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//               TextField(
//                 controller: userController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       await loginAccount(
//                         userController.text,
//                         passController.text,
//                         context,
//                       );
//                     },
//                     child: Text('Login'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:html';

import 'package:exam/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import'pages/history.dart';
import 'mainhome.dart';

class login extends StatefulWidget {

  const login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }




  Future<void> fetchData() async {
    final url = Uri.parse('http://localhost:3000/loginapi/login');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': userController.text,
        'password': passController.text,
        // Add any other data you want to send in the body
      }),
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      print("Response Data: $data");
      print(data['id']);

      if (data['message'] =='successfull') {
        String token = data['Token'];

        // Save email and password to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', userController.text);
        await prefs.setString('password', passController.text);
        await prefs.setString('token', token);


        // Navigate to another page with email and password
        Navigator.push(
          context,
          // MaterialPageRoute(builder: (context) => History(token: token)),
          MaterialPageRoute(builder: (context) => HomePage(token: token, userId: data['id'])),

        );
      } else {
        print('Error: Login failed');
      }
    } else {
      print('Error: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar:AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mainhome()),
            );          },
        ),),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 150),
              Column(
                children: [
                  Text(
                    'LOGIN HERE',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'Enter your Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: 'Enter your Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // await loginAccount(
                      //   userController.text,
                      //   passController.text,
                      //   context,
                      // );
                      fetchData();
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


