import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Print',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Word printer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  //library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = "";
  final wordController = TextEditingController();

  void _word() {
    //print("");
    setState(() {
      _result = wordController.text;

      // hvis man vil printe hvor den siger hello foran
      //_result = "Hello" + wordController.text;

      //String word1Str = wordController.text.trim();
      //print(wordController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Print a word',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                      child: TextField(
                          controller: wordController,
                          inputFormatters: const [],
                          decoration:
                              const InputDecoration(hintText: "Type word"),
                          keyboardType: TextInputType.text)),
                  ElevatedButton(
                      onPressed: _word, child: const Text("your word is")),
                  Flexible(child: Text(_result.toString())),
                ]),
          ],
        ),
      ),
    );
  }
}
