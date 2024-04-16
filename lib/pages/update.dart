import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {
  List<String> generatedTexts = [];
  List<String> messageId = [];
  late String newMessage; // Declare newMessage variable here

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
          messageId =
          List<String>.from(data.map((item) => item['_id'].toString()));
        });
        print(messageId);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  Future<void> updateItem(String id, String newMessage) async {
    try {
      final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/updatedata/$id');
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'message': newMessage}),
      );

      if (response.statusCode == 200) {
        setState(() {
          // Update the generatedTexts list with the new message
          int index = messageId.indexOf(id);
          if (index != -1) {
            generatedTexts[index] = newMessage;
          }
        });
        print('Data updated successfully');
      } else {
        print('Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Texts'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          itemCount: generatedTexts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(generatedTexts[index]),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {
                  String id = messageId[index];
                  newMessage = ''; // Reset newMessage variable
                  newMessage = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Update Message'),
                        content: TextField(
                          decoration: InputDecoration(hintText: 'Enter new message'),
                          onChanged: (value) => newMessage = value,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(newMessage),
                            child: Text('Update'),
                          ),
                        ],
                      );
                    },
                  );
                  if (newMessage != null && newMessage.isNotEmpty) {
                    await updateItem(id, newMessage);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
