import 'package:chatgbt_with_stream/data/models/chatgbt_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    List<ChatGPTModel> data = [
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
      ChatGPTModel(questionText: "", answerText: "", createdTime: ""),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
