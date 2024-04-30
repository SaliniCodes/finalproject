// import 'package:flutter/material.dart';
//
// class recipedetail extends StatefulWidget {
//   final String content;
//
//   recipedetail({Key? key, required this.content}) : super(key: key);
//
//   @override
//   State< recipedetail> createState() => _NextPageState();
// }
//
// class _NextPageState extends State< recipedetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RecipeDetial'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               widget.content,
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class recipedetail extends StatefulWidget {
  final String content;

  recipedetail({Key? key, required this.content}) : super(key: key);

  @override
  State<recipedetail> createState() => _NextPageState();
}

class _NextPageState extends State<recipedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),

        title: Text('RecipeDetail'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.content,
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
