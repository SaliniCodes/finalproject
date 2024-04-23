
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class History extends StatefulWidget {
//   const History({Key? key}) : super(key: key);
//
//   @override
//   _HistoryState createState() => _HistoryState();
// }
//
// class _HistoryState extends State<History> {
//   List<String> generatedTexts = [];
//   List<String> messageId = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     try {
//       final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/getdata');
//       final response = await http.get(uri);
//
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//
//         setState(() {
//           generatedTexts =
//           List<String>.from(data.map((item) => item['message'].toString()));
//           messageId = List<String>.from(data.map((item) => item['_id'].toString()));
//         });
//         print(messageId);
//       } else {
//         print('Failed to fetch data. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.black,
//
//       appBar: AppBar(
//         title: Text('Generated Texts'),
//       ),
//
//         body:RefreshIndicator(
//           onRefresh: () async {
//             await fetchData();
//           },
//           child: ListView.builder(
//             itemCount: generatedTexts.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(generatedTexts[index]),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () async {
//                     String id = messageId[index];
//                     await deleteItem(id);
//                     setState(() {
//                       generatedTexts.removeAt(index);
//                       messageId.removeAt(index);
//                     });
//                   },
//                 ),
//               );
//             },
//           ),),);
//
//   }
//
//
//         Future<void> deleteItem(String id) async {
//     try {
//       final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/deletedata/$id');
//       final response = await http.delete(uri);
//
//       if (response.statusCode == 200) {
//         setState(() {
//           generatedTexts.removeWhere((text) => text == id);
//         });
//         print('Data deleted successfully');
//       } else if (response.statusCode == 404) {
//         print('Data not found');
//       } else {
//         print('Failed to delete data. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error deleting data: $error');
//     }
//   }
//
// }
import 'dart:convert';

import 'package:exam/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

import 'home.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> generatedTexts = [];
  List<String> messageId = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/getdata');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          generatedTexts =
          List<String>.from(data.map((item) => item['message'].toString()));
          messageId = List<String>.from(data.map((item) => item['_id'].toString()));
        });
        print(messageId);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/deletedata/$id');
      final response = await http.delete(uri);

      if (response.statusCode == 200) {
        setState(() {
          generatedTexts.removeWhere((text) => text == id);
        });
        print('Data deleted successfully');
      } else if (response.statusCode == 404) {
        print('Data not found');
      } else {
        print('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting data: $error');
    }
  }
  Future<void> refreshData() async {
    // Call the fetchData method to refresh the data
    await fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeHome()),
            );          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
              // Perform search action
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
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
                  NetworkImage(
'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  NetworkImage(
                    'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
            ),
            // Displaying text in separate containers
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                childAspectRatio: 1, // Aspect ratio of the items
              ),
              itemCount: generatedTexts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle item tap if needed
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width:200,
                    height:100
,
                    // Adjust width
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   generatedTexts[index],
                          //   style: TextStyle(
                          //     fontSize: 18,
                          //     color: Colors.white, // Change the text color here
                          //   ),
                          // ),
                          Text(
                            generatedTexts[index],
                            style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              String id = messageId[index];
                              await deleteItem(id);
                              setState(() {
                                generatedTexts.removeAt(index);
                                messageId.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),



          ],
        ),
      ),
    );
  }
}
//https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D
//https://plus.unsplash.com/premium_photo-1674624131338-eb4ad814b1e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fHw%3D
//https://images.unsplash.com/photo-1464305952250-2460a465b779?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8
//https://images.unsplash.com/photo-1501841580093-a258b1937efe?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8
//https://media.istockphoto.com/id/1465811486/photo/vertical-shot-of-a-plate-full-of-colorful-macaroons-and-cupca.jpg?s=1024x1024&w=is&k=20&c=wvEnfQL48yW2Ih8sUsmOgupTOZPVpdCqZ7BOszlGIbs=
//https://media.istockphoto.com/id/1015989524/photo/cookies-are-served.jpg?s=1024x1024&w=is&k=20&c=2XdyKL9lxHtNJSL-nJzECS2WFlJzHeiBbN1R7Kjk5Fk=
//https://media.istockphoto.com/id/1178510469/photo/delicious-pancakes-with-strawberry-on-brown-wooden-background.jpg?s=1024x1024&w=is&k=20&c=-Lap_GO3xsv5z-g7wzKJS9Y808hhtwhg5f7DUunVKoY=
// ListView.builder(
//   itemCount: generatedTexts.length,
//   itemBuilder: (context, index) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       padding: EdgeInsets.all(10),
//       width: MediaQuery.of(context).size.width - 500,
//       height: MediaQuery.of(context).size.width - 350,
//
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.pinkAccent.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 10,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: SingleChildScrollView( // Wrap with SingleChildScrollView
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 generatedTexts[index],
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () async {
//                 String id = messageId[index];
//                 await deleteItem(id);
//                 setState(() {
//                   generatedTexts.removeAt(index);
//                   messageId.removeAt(index);
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// ),