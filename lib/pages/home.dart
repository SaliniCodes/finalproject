// import 'package:flutter/material.dart';
//
// class RecipeHome extends StatelessWidget {
//   const RecipeHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Image(image: NetworkImage('https://plus.unsplash.com/premium_photo-1664648234285-3b238ab7f17b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
//           ),
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
//
//           ),
//           Padding(padding:EdgeInsets.fromLTRB(16,MediaQuery.of(context).padding.top* 14,
//           16,MediaQuery.of(context).padding.top* 14
//           ),),
//           child:Column(
//             children:[
//               const spacer(),
//               Text(
//                 "Cooking &\nDelicious Food Easily",
//                 style:Theme.of(context).textTheme
//                   .headlineMedium?.copyWith(color:Colors.white),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class RecipeHome extends StatelessWidget {
  const RecipeHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
         Container( width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           child: const Image(
              image: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1664648234285-3b238ab7f17b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
            ),
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
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top * 14,
              16,
              MediaQuery.of(context).padding.top * 14,
            ),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "Cooking &\nDelicious Food Easily", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 17),
                GestureDetector(
                  child: Container(height: 14,
                  decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.circular(12),
                  ),
                   alignment: Alignment.center,
                    child: Text('Get Started',
                     style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
