import 'package:flutter/material.dart';
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
  DrawerIndex drawerIndex = DrawerIndex.HOME;
  SmileGate _smileGate = SmileGate();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
        ),
      ),
    );
    
  }
}