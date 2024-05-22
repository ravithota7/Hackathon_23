import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatService{
  static String davinci="text-davinci-003";
  static String gpt35 = "gpt-3.5-turbo";
  Future<String> chat(types.TextMessage message) async{

    List<OpenAIChatCompletionChoiceMessageModel> messages = [
      const OpenAIChatCompletionChoiceMessageModel(role: OpenAIChatMessageRole.system, content: "You are a helpful assistant")
    ];
    messages.add(
      OpenAIChatCompletionChoiceMessageModel(role: OpenAIChatMessageRole.user, content: message.text)
    );
    final response = await OpenAI.instance.chat.create(model: gpt35, messages: messages);
    print(response.choices[0].message.content);
    return response.choices[0].message.content;
  }

}