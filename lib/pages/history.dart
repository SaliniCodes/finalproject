
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
    return Scaffold(backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text('Generated Texts'),
      ),
  //     body: ListView.builder(
  //       itemCount: generatedTexts.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text(generatedTexts[index]),
  //           trailing: IconButton(
  //             icon: Icon(Icons.delete),
  //             onPressed: () async{
  //               String id = messageId[index];
  //              await deleteItem(id);
  //               fetchData();
  //             },
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
        body:RefreshIndicator(
          onRefresh: () async {
            await fetchData();
          },
          child: ListView.builder(
            itemCount: generatedTexts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(generatedTexts[index]),
                trailing: IconButton(
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
              );
            },
          ),),);

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
