// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'mainhome.dart';
// //
// // class Home extends StatelessWidget {
// //    Home({Key? key}) : super(key: key);
// //   String Textdata = '';
// //   String Textdata1='';
// //
// //   getData()async {
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     setState(() {
// //       Textdata = pref.getString('password')!;
// //       Textdata1 = pref.getString('userEmail')!;
// //
// //     });
// //   }
// //    void initState() {
// //      // TODO: implement initState
// //      getData();
// //    }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Welcome'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           children: [
// //             Text(Textdata),
// //             Text(Textdata1),
// //             Text(
// //               'Welcome !',
// //               style: TextStyle(fontSize: 24.0),
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await FirebaseAuth.instance.signOut();
// //                 Navigator.pop(
// //                   context,
// //                   MaterialPageRoute(builder: (context) {
// //                     return mainhome();
// //                   }),
// //                 );
// //               },
// //               child: Text(
// //                 "SIGNOUT",
// //                 style: GoogleFonts.aladin(),
// //               ),
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.blueGrey,
// //                 foregroundColor: Colors.white,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void setState(Null Function() param0) {}
// // }
// //
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'mainhome.dart';
// //
// // class Home extends StatefulWidget {
// //
// //   @override
// //   _HomeState createState() => _HomeState();
// // }
// //
// // class _HomeState extends State<Home> {
// //   String textData = '';
// //   String textData1 = '';
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     getData();
// //   }
// //
// //   Future<void> getData() async {
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     setState(() {
// //       textData = pref.getString('password') ?? '';
// //       textData1 = pref.getString('emailAddress') ?? '';
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Welcome'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               textData1,
// //               style: TextStyle(fontSize: 18.0),
// //             ),
// //             Text(textData,
// //               style: TextStyle(fontSize: 18.0),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Welcome !',
// //               style: TextStyle(fontSize: 24.0),
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await FirebaseAuth.instance.signOut();
// //                 Navigator.pop(
// //                   context,
// //                   MaterialPageRoute(builder: (context) {
// //                     return mainhome();
// //                   }),
// //                 );
// //               },
// //               child: Text(
// //                 "SIGNOUT",
// //                 style: GoogleFonts.aladin(),
// //               ),
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.blueGrey,
// //                 foregroundColor: Colors.white,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // import 'mainhome.dart';
// //
// // class Home extends StatelessWidget {
// //   final String email;
// //   final String password;
// //
// //   const Home({
// //     Key? key,
// //     required this.email,
// //     required this.password,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User Details'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Email: $email',
// //               style: TextStyle(fontSize: 18.0),
// //             ),
// //             Text(
// //               'Password: $password',
// //               style: TextStyle(fontSize: 18.0),
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await FirebaseAuth.instance.signOut();
// //                 Navigator.pop(
// //                   context,
// //                   MaterialPageRoute(builder: (context) {
// //                     return mainhome();
// //                   }),
// //                 );
// //               },
// //               child: Text(
// //                 "SIGNOUT",
// //                 style: GoogleFonts.aladin(),
// //               ),
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.blueGrey,
// //                 foregroundColor: Colors.white,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'mainhome.dart';
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//    late String email;
//    late String password;
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   Future<void> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       email = prefs.getString('email') ?? '';
//       password = prefs.getString('password') ?? '';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Email: $email',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Text(
//               'Password: $password',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.pop(
//                   context,
//                   MaterialPageRoute(builder: (context) {
//                     return mainhome();
//                   }),
//                 );
//               },
//               child: Text(
//                 "SIGNOUT",
//                 style: GoogleFonts.aladin(),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueGrey,
//                 foregroundColor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainhome.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    String email ='';
   String password='';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? ''; // Initialize with default value
      password = prefs.getString('password') ?? ''; // Initialize with default value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: ${email != null ? email : ""}', // Check for null value before accessing
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Password: ${password != null ? password : ""}', // Check for null value before accessing
              style: TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return mainhome();
                  }),
                );
              },
              child: Text(
                "SIGNOUT",
                style: GoogleFonts.aladin(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
