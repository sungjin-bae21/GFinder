import 'package:flutter/material.dart';
import 'package:g_finder/visibility_widget.dart';
import 'employ_widget.dart';
import 'smile_gate.dart';
import 'app_theme.dart';

enum DrawerIndex {
  HOME,
  COMPANY_INFO,
}


class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainWidgetState();
  }
}

class _MainWidgetState extends State<MainWidget> {
  Widget htmlLoader = VisibilityWidget();
  DrawerIndex drawerIndex = DrawerIndex.HOME;
  SmileGate _smileGate = SmileGate();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(title: Text("Find"), leading: VisibilityWidget()),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
    
  }
}