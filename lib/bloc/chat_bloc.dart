import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:exam/repos/chat_repo.dart';

import '../models/chat_message_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  List<ChatMessageModel> messages = [];
  bool generating = false;

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
    messages.add(ChatMessageModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSuccessState(messages: messages));
    generating = true;
    String generatedText = await ChatRepo.chatTextGenerationRepo(messages);
    if (generatedText.length > 0) {
      messages.add(ChatMessageModel(
          role: 'model', parts: [ChatPartModel(text: generatedText)]));
      emit(ChatSuccessState(messages: messages));
    }
    generating = false;
  }
}
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:exam/repos/chat_repo.dart';
// import '../models/chat_message_model.dart';
//
// part 'chat_event.dart';
// part 'chat_state.dart';
//
// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   ChatBloc() : super(ChatSuccessState(messages: [])) {
//     on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
//   }
//
//   List<ChatMessageModel> messages = [];
//   bool generating = false;
//
//   FutureOr<void> chatGenerateNewTextMessageEvent(
//       ChatGenerateNewTextMessageEvent event,
//       Emitter<ChatState> emit,
//       ) async {
//     messages.add(ChatMessageModel(
//       role: "user",
//       parts: [ChatPartModel(text: event.inputMessage)],
//     ));
//     emit(ChatSuccessState(messages: messages));
//
//     try {
//       final url = Uri.parse('http://localhost:3000/recipelistapi/dataupload');
//       final generatedText = await ChatRepo.chatTextGenerationRepo(messages);
//
//       final response = await http.post(
//         url,
//         body: {
//           'sender': 'John Doe', // Replace with actual sender
//           'message': generatedText,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         print('Chat message saved successfully.');
//         // Proceed with generating response, if necessary...
//       } else {
//         print('Failed to save chat message. Status code: ${response.statusCode}');
//         // Handle failure if needed...
//       }
//     } catch (error) {
//       print('Error saving chat message: $error');
//       // Handle error...
//     }
//   }
// }
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:exam/repos/chat_repo.dart';
// import '../models/chat_message_model.dart';
//
// part 'chat_event.dart';
// part 'chat_state.dart';
//
// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   ChatBloc() : super(ChatSuccessState(messages: [])) {
//     on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
//   }
//
//   List<ChatMessageModel> messages = [];
//   bool generating = false;
//
//   FutureOr<void> chatGenerateNewTextMessageEvent(
//       ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
//     messages.add(ChatMessageModel(
//         role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
//     emit(ChatSuccessState(messages: messages));
//     generating = true;
//
//     try {
//       String generatedText = await ChatRepo.chatTextGenerationRepo(messages);
//       if (generatedText.isNotEmpty) {
//         messages.add(ChatMessageModel(
//             role: 'model', parts: [ChatPartModel(text: generatedText)]));
//         emit(ChatSuccessState(messages: messages));
//
//         final url = Uri.parse('http://localhost:3000/recipelistapi/dataupload');
//         final response = await http.post(
//           url,
//           body: {
//             'sender': 'AI',
//             'message': generatedText,
//           },
//         );
//
//         if (response.statusCode == 200) {
//           print('AI-generated message saved successfully.');
//         } else {
//           print('Failed to save AI-generated message. Status code: ${response.statusCode}');
//         }
//       }
//     } catch (error) {
//       print('Error generating or saving message: $error');
//     } finally {
//       generating = false;
//     }
//   }
// }
