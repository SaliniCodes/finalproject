// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';
// import 'package:exam/bloc/chat_bloc.dart';
// import 'package:exam/models/chat_message_model.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../bloc/chat_bloc.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final ChatBloc chatBloc = ChatBloc();
//   TextEditingController textEditingController = TextEditingController();
//   // Function to send chat message data to backend
//   Future<void> saveChatMessage(ChatMessageModel message) async {
//     final Uri uri = Uri.parse('http://localhost:3000/recipelistapi/dataupload');
//
//     final String sender = 'John Doe'; // Replace 'John Doe' with the actual sender
//     final String textMessage = message.text ?? ''; // Ensure message.text is not null
//
//     final Map<String, dynamic> requestBody = {
//       'sender': sender,
//       'message': textMessage,
//       // Add other necessary fields
//     };
//
//     final response = await http.post(
//       uri,
//       body: json.encode(requestBody),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       print('Chat message saved successfully.');
//     } else {
//       print('Failed to save chat message.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<ChatBloc, ChatState>(
//         bloc: chatBloc,
//         listener: (context, state) {},
//         builder: (context, state) {
//           switch (state.runtimeType) {
//             case ChatSuccessState:
//               List<ChatMessageModel> messages =
//                   (state as ChatSuccessState).messages;
//               return Container(
//                 width: double.maxFinite,
//                 height: double.maxFinite,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         opacity: 0.5,
//                         // image: AssetImage("assets/recipe_bg"),
//                         image: NetworkImage("https://plus.unsplash.com/premium_photo-1661587759162-d2dd4934ce33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlfGVufDB8fDB8fHww"),
//
//                         fit: BoxFit.cover)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       height: 100,
//                       child: const Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Find your recipe",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 24),
//                           ),
//                           Icon(Icons.image_search, color: Colors.white)
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                         child: ListView.builder(
//                           itemCount: messages.length,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16),
//                                 color: Colors.amber.withOpacity(0.1),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         messages[index].role == "user" ? "User" : "Genereted message",
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: messages[index].role == "user"
//                                               ? Colors.amber
//                                               : Colors.purple.shade200,
//                                         ),
//                                       ),
//                                       IconButton(
//                                         icon: Icon(Icons.save),
//                                         onPressed: () {
//                                           saveChatMessage(messages[index]);
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 12),
//                                   Text(
//                                     messages[index].parts.first.text,
//                                     style: TextStyle(height: 1.2),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         )
//
//                       // ListView.builder(
//                         //     itemCount: messages.length,
//                         //     itemBuilder: (context, index) {
//                         //       return Container(
//                         //           margin: const EdgeInsets.only(
//                         //               bottom: 12, left: 16, right: 16),
//                         //           padding: const EdgeInsets.all(16),
//                         //           decoration: BoxDecoration(
//                         //               borderRadius: BorderRadius.circular(16),
//                         //               color: Colors.amber.withOpacity(0.1)),
//                         //           child: Column(
//                         //             crossAxisAlignment:
//                         //             CrossAxisAlignment.start,
//                         //             children: [
//                         //               Text(
//                         //                 messages[index].role == "user"
//                         //                     ? "User"
//                         //                     : "Creating recipe",
//                         //                 style: TextStyle(
//                         //                     fontSize: 14,
//                         //                     color:
//                         //                     messages[index].role == "user"
//                         //                         ? Colors.amber
//                         //                         : Colors.purple.shade200),
//                         //               ),
//                         //               const SizedBox(
//                         //                 height: 12,
//                         //               ),
//                         //               Text(
//                         //                 messages[index].parts.first.text,
//                         //                 style: TextStyle(height: 1.2),
//                         //               ),
//                         //             ],
//                         //           ));
//                         //     })
//                     ),
//                     if (chatBloc.generating)
//                       Row(
//                         children: [
//                           Container(
//                               height: 100,
//                               width: 100,
//                               child: Lottie.asset('')),
//                           const SizedBox(width: 20),
//                           Text("Loading...")
//                         ],
//                       ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 16),
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: TextField(
//                                 controller: textEditingController,
//                                 style: TextStyle(color: Colors.black),
//                                 cursorColor: Theme.of(context).primaryColor,
//                                 decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(100),
//                                     ),
//                                     fillColor: Colors.white,
//                                     hintText: "Ask Something from AI",
//                                     hintStyle:
//                                     TextStyle(color: Colors.grey.shade400),
//                                     filled: true,
//                                     focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(100),
//                                         borderSide: BorderSide(
//                                             color:
//                                             Theme.of(context).primaryColor))),
//                               )),
//                           const SizedBox(width: 12),
//                           InkWell(
//                             onTap: () {
//                               if (textEditingController.text.isNotEmpty) {
//                                 String text = textEditingController.text;
//                                 textEditingController.clear();
//                                 chatBloc.add(ChatGenerateNewTextMessageEvent(
//                                     inputMessage: text));
//                               }
//                             },
//                             child: CircleAvatar(
//                               radius: 32,
//                               backgroundColor: Colors.white,
//                               child: CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: Theme.of(context).primaryColor,
//                                 child: Center(
//                                   child: Icon(Icons.send, color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//
//             default:
//               return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:exam/bloc/chat_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:exam/models/chat_message_model.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.5,
                    image: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1661587759162-d2dd4934ce33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaXBlfGVufDB8fDB8fHww"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 100,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Find your recipe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Icon(Icons.image_search, color: Colors.white),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                              left: 16,
                              right: 16,
                            ),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.amber.withOpacity(0.1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      messages[index].role == "user"
                                          ? "User"
                                          : "Generated message",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: messages[index].role == "user"
                                            ? Colors.amber
                                            : Colors.purple.shade200,
                                      ),
                                    ),
                                    if (messages[index].role != "user")

                                      IconButton(
                                      icon: Icon(Icons.save),
                                      onPressed: () {
                                        saveChatMessage(messages[index]);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  messages[index].parts.first.text,
                                  style: TextStyle(height: 1.2),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (chatBloc.generating)
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Lottie.asset(''),
                          ),
                          const SizedBox(width: 20),
                          Text("Loading..."),
                        ],
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fillColor: Colors.white,
                                hintText: "Ask Something from AI",
                                hintStyle:
                                TextStyle(color: Colors.grey.shade400),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatBloc.add(
                                  ChatGenerateNewTextMessageEvent(
                                    inputMessage: text,
                                  ),
                                );
                              }
                            },
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                Theme.of(context).primaryColor,
                                child: Center(
                                  child:
                                  Icon(Icons.send, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }

  Future<void> saveChatMessage(ChatMessageModel message) async {
    final Uri uri =
    Uri.parse('http://localhost:3000/recipelistapi/dataupload');

    final String sender = 'AI';
    final String generatedText = message.parts.first.text ?? '';

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