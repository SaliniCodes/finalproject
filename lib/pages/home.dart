// // import 'package:flutter/material.dart';
// //
// // class RecipeHome extends StatelessWidget {
// //   const RecipeHome({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(backgroundColor: Colors.black,
// //       body: Stack(
// //         children: [
// //           Image(image: NetworkImage('https://plus.unsplash.com/premium_photo-1664648234285-3b238ab7f17b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
// //           ),
// //           Container(
// //             width: MediaQuery.of(context).size.width,
// //             height: MediaQuery.of(context).size.height,
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [
// //                   Colors.black,
// //                   Colors.transparent,
// //                 ],
// //                 stops: [
// //                   0.2,
// //                   1,
// //                 ],
// //                 begin: Alignment.bottomCenter,
// //                 end: Alignment.topCenter,
// //               ),
// //             ),
// //
// //           ),
// //           Padding(padding:EdgeInsets.fromLTRB(16,MediaQuery.of(context).padding.top* 14,
// //           16,MediaQuery.of(context).padding.top* 14
// //           ),),
// //           child:Column(
// //             children:[
// //               const spacer(),
// //               Text(
// //                 "Cooking &\nDelicious Food Easily",
// //                 style:Theme.of(context).textTheme
// //                   .headlineMedium?.copyWith(color:Colors.white),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// class RecipeHome extends StatelessWidget {
//   const RecipeHome({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//          Container( width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
//            child: const Image(
//               image: NetworkImage(
//                   'https://plus.unsplash.com/premium_photo-1664648234285-3b238ab7f17b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
//             ),
//          ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.black,
//                   Colors.transparent,
//                 ],
//                 stops: [
//                   0.2,
//                   1,
//                 ],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
import 'package:exam/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam/pages/history.dart';

import '../mainhome.dart';


class RecipeHome extends StatelessWidget {
  const RecipeHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: [
              // Replace these containers with network images
              // NetworkImage(
              //   'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y29va2luZ3xlbnwwfHwwfHx8MA%3D%3D',
              // ),
              // NetworkImage('https://images.unsplash.com/photo-1504387828636-abeb50778c0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlY2lwZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D'
              // ),
              // NetworkImage('https://plus.unsplash.com/premium_photo-1661582001283-cb723906b901?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlJTIwaW1hZ2VzJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D'
              // ),
              NetworkImage('https://plus.unsplash.com/premium_photo-1664283229621-794dec382c4b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNvb2tpbmd8ZW58MHx8MHx8fDA%3D'
              ),
              NetworkImage('https://images.unsplash.com/photo-1540420828642-fca2c5c18abe?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNvb2tpbmd8ZW58MHx8MHx8fDA%3D'
              ),

              NetworkImage('https://plus.unsplash.com/premium_photo-1674624131338-eb4ad814b1e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fHw%3D'

              ),

            ].map((imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [
                  0.2,
                  1,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Cooking ',
                    style: GoogleFonts.lobster(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white, fontSize: 24), // Font size for the first letter
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '& Delicious Food Easily',
                        style: GoogleFonts.lobster(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.white, fontSize: 18), // Font size for the remaining text
                        ),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: 16),
                ElevatedButton(style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red.withOpacity(0.87), // Red color with 87% opacity

                  ),
                ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (context) => History()),
                      MaterialPageRoute(builder: (context) => mainhome()),

                    );
                  },
                  child: Text('Get Started',style: GoogleFonts.lobster(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
