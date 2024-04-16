//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
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
//       isLoading = true; // Set loading state when fetching data
//       isError = false; // Reset error state
//       isSearched = true; // Set search performed state
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
//           isLoading = false; // Clear loading state after data is fetched
//         });
//         print(messageId);
//       } else {
//         print('Failed to fetch data. Status code: ${response.statusCode}');
//         setState(() {
//           isError = true; // Set error state if fetching data fails
//           isLoading = false; // Clear loading state
//         });
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       setState(() {
//         isError = true; // Set error state if an error occurs
//         isLoading = false; // Clear loading state
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     fetchData(searchController.text);
//                   },
//                   icon: Icon(Icons.search),
//                 ),
//               ),
//             ),
//           ),
//           isLoading
//               ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
//               : isError
//               ? Center(
//             child: Text('Error fetching data. Please try again.'), // Show error message if fetching data fails
//           )
//               : isSearched
//               ? generatedTexts.isEmpty
//               ? Center(child: Text('No results found.')) // Show message if no results are found after search
//               : Expanded(
//             child: ListView.builder(
//               itemCount: generatedTexts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(generatedTexts[index]),
//                   // Add more UI elements based on fetched data if needed
//                 );
//               },
//             ),
//           )
//               : Container(), // Hide "No results found" message before search
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  onPressed: () {
                    search(searchController.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : isError
              ? Center(
            child: Text('Error fetching data. Please try again.'),
          )
              : isSearched
              ? generatedTexts.isEmpty
              ? Center(child: Text('No results found.'))
              : Expanded(
            child: ListView.builder(
              itemCount: generatedTexts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(generatedTexts[index]),

                );
              },
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}
