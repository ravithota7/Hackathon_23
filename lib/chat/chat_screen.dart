import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hackathon/chat/chat_service.dart';


String randomString(){
  final random = Random.secure();
  final values = List<int>.generate(16, (index) => random.nextInt(255));
  return base64Encode(values);
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _user = const types.User(id: 'user');
  final _assistant = const types.User(id: 'assistant');
  List<types.Message> _messages = [];
  final ChatService chatService = ChatService();

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
        appBar: AppBar(),
        body: Chat(
            messages: _messages,
            onSendPressed: _handleSend,
            user: _user
            ));
  }

  void _addMessage(types.TextMessage message){
    setState(() {
        _messages.insert(0, message);    
    });
  }

  void _removeTyping(){
    if(_messages.isNotEmpty && _messages.first.metadata!=null && _messages.first.metadata!['message']=='typing'){
      setState(() {
        _messages.removeAt(0);
      });
    }
  }

  void _insertTyping(){
    final messageMetadata =  _messages[0].metadata;
    if(messageMetadata?['message'] == null ||  messageMetadata!['message']!='typing'){
      _addMessage(types.TextMessage(
        author: _assistant,
        id: randomString(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: "typing...",
        metadata: const {'message':'typing'}
      ));
    }
  }

  _handleSend(types.PartialText message) async {
    final userMessage = types.TextMessage(
      author: _user,
      id: randomString(),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: message.text
    );
    _addMessage(userMessage);
    _insertTyping();
    final response = await chatService.chat(userMessage);
    _removeTyping();
    final responseMessage = types.TextMessage(
      author: _assistant,
      id: randomString(),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: response
    );
    _addMessage(responseMessage);
  }
}
