import 'dart:async';
import 'package:chatgbt_with_stream/data/models/chatgbt_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<ChatGPTModel> streamController =
      StreamController<ChatGPTModel>.broadcast();
  late StreamSubscription streamSubscription;
  String text = "";

  late Stream<ChatGPTModel> stream = createNewUser(
      ChatGPTModel(questionText: "Salom", createdTime: "", answerText: "Alik"));

  @override
  void initState() {
    streamSubscription = streamController.stream.listen((event) {
      setState(() {
        stream = createNewUser(event);
      });
    });
    super.initState();
  }

  Stream<ChatGPTModel> createNewStream() async* {
    yield ChatGPTModel(
        answerText: "Qaleysiz", createdTime: "", questionText: "");
    await Future.delayed(const Duration(seconds: 3));
    yield ChatGPTModel(
        answerText: "Yaxshimisiz", createdTime: "", questionText: "");
    await Future.delayed(const Duration(seconds: 5));
    yield ChatGPTModel(
        answerText: "Ahvollar qanday", createdTime: "", questionText: "");
  }

  Stream<ChatGPTModel> createNewUser(ChatGPTModel chatGPTModel) async* {
    yield chatGPTModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return Text(
                    text == data.questionText
                        ? "My answer: ${data.answerText}"
                        : "Matnni kiriting",
                    style: const TextStyle(fontSize: 26),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (v) {
                      setState(() {
                        v = text;
                      });
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      hoverColor: Colors.black,
                      focusColor: Colors.black,
                      hintText: "Matnni kiriting",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // streamSubscription.pause();
                    // print(streamSubscription.isPaused);
                    // streamController.addStream(createNewStream());
                    // streamController.addError("ERRROR");
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
