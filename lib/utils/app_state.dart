import 'package:flutter/material.dart';
import 'markdown_styles.dart';

class AppState extends ChangeNotifier {
  MarkdownStyle currentStyle = MarkdownStyle.standard;
  String currentMarkdown = '';
  
  void changeStyle(MarkdownStyle newStyle) {
    currentStyle = newStyle;
    notifyListeners();
  }
  
  void updateMarkdown(String content) {
    currentMarkdown = content;
    notifyListeners();
  }
}