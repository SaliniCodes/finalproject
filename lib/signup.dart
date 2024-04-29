// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'Home.dart';
//
//
// class signup extends StatelessWidget {
//   signup({Key? key}) : super(key: key);
//
//   TextEditingController usercontroller = TextEditingController();
//   TextEditingController passcontroller = TextEditingController();
//
//   Future<void> register(String email, String password, BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Home()),
//       );
//     } catch (e) {
//       // Handle registration failure
//       print('Error: $e');
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
//
//               SizedBox(height: 150),
//               Column(
//                 children: [
//                   // Text('SIGN UP'),
//                   Text(
//                     'SIGN UP',
//                     style: TextStyle(fontWeight:FontWeight.w600,
//                       fontSize: 20, // Set the desired font size
//                       color: Colors.green, // Set the desired font color
//                       // You can also set other properties like fontWeight, fontStyle, etc. if needed
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
//                       register(usercontroller.text, passcontroller.text, context);
//                     },
//                     child: Text('Create Account',),
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
import 'dart:convert';
import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home.dart';
import 'package:http/http.dart' as http;

import 'mainhome.dart';


class signup extends StatelessWidget {
  signup({Key? key}) : super(key: key);

  TextEditingController fcontroller = TextEditingController();
  TextEditingController lcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();




  Future<void>register(String firstname,String lastname,String email,String phone, String password,String age,BuildContext context) async {
    String url = "http://localhost:3000/api/dataupload";
    Uri Url = Uri.parse(url);

    print(Url);
    try {
      var response = await http.post(
        Url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "firstname":firstname,
          "lastname":lastname,
          "email": email,
           "phone":phone,
          "password": password,
          "age":age,
        }),
      );

      if (response.statusCode == 200) {
        print("Data Stored successfully: ${response.body}");
        // Navigate to Home screen upon successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error sending request: $e");
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

              SizedBox(height: 50),
              Column(
                children: [
                  // Text('SIGN UP'),
                  Text(
                    'SIGN UP',
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),


                ],
              ),
              TextField(
                controller: fcontroller,style:TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your firstname',
                  labelStyle: TextStyle(color: Colors.white), // Color of the label text

                  hintStyle: TextStyle(color: Colors.white), // Color of the hint text

                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: lcontroller,style:TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your lastname',
                  labelStyle: TextStyle(color: Colors.white), // Color of the label text

                  hintStyle: TextStyle(color: Colors.white), // Color of the hint text

                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: emailcontroller,style:TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(color: Colors.white), // Color of the label text

                  hintStyle: TextStyle(color: Colors.white), // Color of the hint text

                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 5),

              TextField(
                controller: pcontroller,style:TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your phone',
                  labelStyle: TextStyle(color: Colors.white), // Color of the label text

                  hintStyle: TextStyle(color: Colors.white), // Color of the hint text

                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 5),

              TextField(
                controller: passcontroller,style:TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(color: Colors.white), // Color of the label text

                  hintStyle: TextStyle(color: Colors.white), // Color of the hint text

                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 5),

              TextField(
                controller: agecontroller,style:TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your age',
                  labelStyle: TextStyle(color: Colors.white), // Color of the label text

                  hintStyle: TextStyle(color: Colors.white), // Color of the hint text

                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Row(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        register(fcontroller.text,lcontroller.text,emailcontroller.text,pcontroller.text, passcontroller.text,agecontroller.text,context);
                      },
                      child: Text('Create Account',),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
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