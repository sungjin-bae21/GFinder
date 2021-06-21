import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class EmpolyWidget extends StatefulWidget {
  @override
  EmployInfo createState() {
    return EmployInfo();
  }
  
}

class EmployInfo extends State<EmpolyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      )
    );
  }
}