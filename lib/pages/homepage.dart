import 'package:flutter/material.dart';

import 'httpservis.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    super.initState();
    _loadingJson();
  }

  _loadingJson() async {
    Network.GET(Network.API_List, Network.paramsEmpty()).then((value) {
      setState(() {
        data = value;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: data == ''
            ? CircularProgressIndicator()
            : Text(data != null ? data : "No data"),
      ),
    );
  }
}
