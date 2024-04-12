// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// //
// // class History extends StatefulWidget {
// //   const History({Key? key}) : super(key: key);
// //
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<History> {
// //   List<String> generatedTexts = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchData();
// //   }
// //
// //   Future<void> fetchData() async {
// //     try {
// //       final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/getdata');
// //       final response = await http.get(uri);
// //
// //       if (response.statusCode == 200) {
// //         final List<dynamic> data = json.decode(response.body);
// //
// //         setState(() {
// //           generatedTexts = List<String>.from(data.map((item) => item['message'].toString()));
// //         });
// //       } else {
// //         print('Failed to fetch data. Status code: ${response.statusCode}');
// //       }
// //     } catch (error) {
// //       print('Error fetching data: $error');
// //     }
// //   }
// //
// //
// //   @override
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Generated Texts'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: generatedTexts.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text(generatedTexts[index]),
// //             trailing: IconButton(
// //               icon: Icon(Icons.delete),
// //               onPressed: () {
// //                 // Call a function to handle deletion, passing the index of the item to delete
// //                 deleteItem(index);
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   void deleteItem(int index) {
// //     // Perform deletion logic here
// //     setState(() {
// //       generatedTexts.removeAt(index);
// //     });
// //   }
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
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
//           generatedTexts = List<String>.from(data.map((item) => item['message'].toString()));
//         });
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Generated Texts'),
//       ),
//       body: ListView.builder(
//         itemCount: generatedTexts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(generatedTexts[index]),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {
//                 // Call a function to handle deletion, passing the index of the item to delete
//                 deleteItem(index);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void deleteItem(int index) {
//     // Perform deletion logic here
//     setState(() {
//       generatedTexts.removeAt(index);
//     });
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Texts'),
      ),
      body: ListView.builder(
        itemCount: generatedTexts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(generatedTexts[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                String id = messageId[index];
                deleteItem(id);
              },
            ),
          );
        },
      ),
    );
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

}
