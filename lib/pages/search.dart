//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:exam/bloc/chat_bloc.dart';
// import 'package:exam/models/chat_message_model.dart';
//
// import 'history.dart';
//
//
// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);
//
//   @override
//   State<Search> createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   List<String> generatedTexts = [];
//   List<String> messageId = [];
//   TextEditingController searchController = TextEditingController();
//   bool isLoading = false;
//   bool isError = false;
//   bool isSearched = false;
//
//   Future<void> fetchData(String query) async {
//     setState(() {
//       isLoading = true;
//       isError = false;
//       isSearched = true;
//     });
//
//     try {
//       final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/getsearcheddata?query=$query');
//       final response = await http.get(uri);
//
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//
//         setState(() {
//           generatedTexts = List<String>.from(data.map((item) => item['message'].toString()));
//           messageId = List<String>.from(data.map((item) => item['_id'].toString()));
//           isLoading = false;
//         });
//         print(messageId);
//       } else {
//         print('Failed to fetch data. Status code: ${response.statusCode}');
//         setState(() {
//           isError = true;
//           isLoading = false;
//         });
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       setState(() {
//         isError = true;
//         isLoading = false;
//       });
//     }
//   }
//
//   void search(String query) {
//     List<String> words = query.split(',');
//     String searchQuery = words.join('|');
//
//     fetchData(searchQuery);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => History()),
//             );          },
//         ),
//       ),
//       body: Stack(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 aspectRatio: MediaQuery.of(context).size.width /
//                     MediaQuery.of(context).size.height,
//                 viewportFraction: 1.0,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 3),
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//               ),
//               items: [
//                 // NetworkImage(
//                 //   'https://images.unsplash.com/photo-1498612753354-772a30629934?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlJTIwaW1hZ2VzfGVufDB8fDB8fHww',
//                 // ),
//                 NetworkImage(
//                   'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                 ),
//                 NetworkImage(
//                   'https://images.unsplash.com/photo-1504387828636-abeb50778c0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlY2lwZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D',
//                 ),
//                 NetworkImage(
//                   'https://plus.unsplash.com/premium_photo-1661582001283-cb723906b901?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlJTIwaW1hZ2VzJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D',
//                 ),
//                 NetworkImage(
//                   'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//                 ),
//                 NetworkImage('https://plus.unsplash.com/premium_photo-1674624131338-eb4ad814b1e8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fHw%3D'
//
//                 ),
//
//               ].map((imageProvider) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(35.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Search bar with black background
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black26,
//                     borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: TextField(
//                       controller: searchController,
//                       style: TextStyle(color: Colors.white), // Text color
//                       decoration: InputDecoration(
//                         hintText: 'Search...',
//                         hintStyle: TextStyle(color: Colors.white), // Hint text color
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             search(searchController.text);
//                           },
//                           icon: Icon(Icons.search, color: Colors.white), // Icon color
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Expanded(
//                   child: Container(
//                     width: 50,
//                     height: 450,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black12, width: 1.0),
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white54,
//                     ),
//                     child: isLoading
//                         ? Center(child: CircularProgressIndicator())
//                         : isError
//                         ? Center(
//                       child: Text(
//                         'Error fetching data. Please try again.',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                         : isSearched
//                         ? generatedTexts.isEmpty
//                         ? Center(
//                       child: Text(
//                         'No results found.',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                         : ListView.builder(
//
//                       itemCount: generatedTexts.length,
//                       itemBuilder: (context, index) {
//                         double fontSize = 16.0;
//
//                         if (generatedTexts[index].contains(':') ||
//                             generatedTexts[index].contains('*')) {
//                           fontSize = 20.0;
//                         }
//                         return ListTile(
//                           title: Text(
//                             generatedTexts[index],
//                             style: GoogleFonts.lobster(
//                               textStyle: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: fontSize,
//                               ),
//                             ),
//                           ),
//
//                         );
//                       },
//                     )
//                         : Container(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:exam/models/chat_message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam/bloc/chat_bloc.dart';

import 'history.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> generatedTexts = [];
  List<String> messageId = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool isError = false;
  bool isSearched = false;

  Future<void> fetchData(String query) async {
    setState(() {
      isLoading = true;
      isError = false;
      isSearched = true;
    });

    try {
      final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/getsearcheddata?query=$query');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          generatedTexts = List<String>.from(data.map((item) => item['message'].toString()));
          messageId = List<String>.from(data.map((item) => item['_id'].toString()));
          isLoading = false;
        });
        print(messageId);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  void search(String query) {
    List<String> words = query.split(',');
    String searchQuery = words.join('|');

    fetchData(searchQuery);
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
              MaterialPageRoute(builder: (context) => History()),
            );
          },
        ),
      ),
      body: Stack(
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
                // NetworkImage(
                //   'https://images.unsplash.com/photo-1498612753354-772a30629934?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlJTIwaW1hZ2VzfGVufDB8fDB8fHww',
                // ),
                NetworkImage(
                  'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                NetworkImage(
                  'https://images.unsplash.com/photo-1504387828636-abeb50778c0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlY2lwZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D',
                ),
                NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1661582001283-cb723906b901?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlJTIwaW1hZ2VzJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D',
                ),
                NetworkImage(
                  'https://images.unsplash.com/photo-1493808997710-b9681bc18443?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Search bar with black background
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white), // Text color
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.white), // Hint text color
                        suffixIcon: IconButton(
                          onPressed: () {
                            search(searchController.text);
                          },
                          icon: Icon(Icons.search, color: Colors.white), // Icon color
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 450,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54,
                    ),
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : isError
                        ? Center(
                      child: Text(
                        'Error fetching data. Please try again.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                        : isSearched
                        ? generatedTexts.isEmpty
                        ? Center(
                      child: Text(
                        'No results found.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                        : ListView.builder(
                      itemCount: generatedTexts.length,
                      itemBuilder: (context, index) {
                        double fontSize = 16.0;

                        if (generatedTexts[index].contains(':') ||
                            generatedTexts[index].contains('*')) {
                          fontSize = 20.0;
                        }
                        return ListTile(
                          title: Text(
                            generatedTexts[index],
                            style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: fontSize,
                              ),
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.save),
                            onPressed: () {
                              saveChatMessage(generatedTexts[index]);
                            },
                          ),
                        );
                      },
                    )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveChatMessage(String generatedText) async {
    final Uri uri =
    Uri.parse('http://localhost:3000/recipelistapi/searchedrecipeupload');

    final String sender = 'AI';

    final Map<String, dynamic> requestBody = {
      'sender': sender,
      'message': generatedText,
    };

    final response = await http.post(
      uri,
      body: json.encode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Chat message saved successfully.');
    } else {
      print('Failed to save chat message.');
    }
  }
}

