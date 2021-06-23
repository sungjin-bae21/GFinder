import 'package:flutter/material.dart';
import 'html_loader.dart';
  
  class VisibilityWidget extends StatefulWidget {
    @override
    _VisibilityWidgetState createState() {
      return _VisibilityWidgetState();
    }
  }
  
  class _VisibilityWidgetState extends State {
    bool _isVisible = false;
  
    void showToast() {
      setState(() {
        _isVisible = !_isVisible;
      });
    }
  
    @override
    Widget build(BuildContext context) {
      print("???");
      return Visibility (
          visible: _isVisible,
          maintainState: true,
          child: HtmlLoader()
      );
    }
}