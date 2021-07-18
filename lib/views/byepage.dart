import 'package:flutter/material.dart';

class ByePage extends StatefulWidget {
  const ByePage({Key? key}) : super(key: key);

  @override
  _ByePageState createState() => _ByePageState();
}

class _ByePageState extends State<ByePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Byebye!"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgbye.jpg"),
          ),
        ),
      ),
    );
  }
}
