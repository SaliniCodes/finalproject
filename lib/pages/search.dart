
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';


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
      // appBar: AppBar(
      //   title: Text('Search'),
      // ),
      body: Stack(
        children: [
          // Background carousel slider
          // CarouselSlider(
          //   items: [
          //     Image.network('https://images.unsplash.com/photo-1498612753354-772a30629934?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlJTIwaW1hZ2VzfGVufDB8fDB8fHww'),
          //     Image.network('https://images.unsplash.com/photo-1504387828636-abeb50778c0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlY2lwZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D'),
          //     Image.network('https://plus.unsplash.com/premium_photo-1661582001283-cb723906b901?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlJTIwaW1hZ2VzJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D'),
          //   ],
          //   options: CarouselOptions(
          //     // aspectRatio: MediaQuery.of(context).size.width /
          //     //     MediaQuery.of(context).size.height,
          //     // viewportFraction: 1.0,
          //     // autoPlay: true,
          //     // autoPlayInterval: Duration(seconds: 3),
          //     // autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     // autoPlayCurve: Curves.fastOutSlowIn,
          //      aspectRatio: MediaQuery.of(context).size.width /
          //     //     MediaQuery.of(context).size.height,
          //     viewportFraction: 1.0,
          //     autoPlay: true,
          //     autoPlayInterval: Duration(seconds: 3),
          //     autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //   ),
          // ),
          // Search bar and results
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
              NetworkImage(
                'https://images.unsplash.com/photo-1498612753354-772a30629934?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmVjaXBlJTIwaW1hZ2VzfGVufDB8fDB8fHww',
              ),
              NetworkImage('https://images.unsplash.com/photo-1504387828636-abeb50778c0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlY2lwZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D'
              ),
              NetworkImage('https://plus.unsplash.com/premium_photo-1661582001283-cb723906b901?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlJTIwaW1hZ2VzJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D'
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
                SizedBox(height:30 ),
                Container(width: 50,height: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12,width: 1.0), // Add border to the container
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54, // Transparent background for search results
// Optional: add border radius
                  ),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : isError
                      ? Center(
                    child: Text('Error fetching data. Please try again.', style: TextStyle(color: Colors.white)),
                  )
                      : isSearched
                      ? generatedTexts.isEmpty
                      ? Center(child: Text('No results found.', style: TextStyle(color: Colors.white)))
                      : ListView.builder(
                    itemCount: generatedTexts.length,
                    itemBuilder: (context, index) {
                      // double fontSize = generatedTexts[index].length > 15 ? 20.0 : 10.0;
                      // double fontSize = generatedTexts[index].contains(':') ? 16.0 : 25.0;

                      double fontSize = 16.0;

                      if (generatedTexts[index].contains(':') || generatedTexts[index].contains('*')) {
                        fontSize = 20.0; // Set a larger font size for section headers
                      }
                      return ListTile(
                        title: Text(generatedTexts[index],  style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,


                            // Other text styles such as fontSize, fontWeight can be applied here
                          ),
                        ),),
                      );
                    },
                  )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
