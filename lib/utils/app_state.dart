import 'package:flutter/material.dart';
import 'markdown_styles.dart';
import 'markdown_converter.dart'; // 新增导入

class AppState extends ChangeNotifier {
  String htmlContent = '';
  MarkdownStyle currentStyle = MarkdownStyle.elegant;
  String currentMarkdown = '';

  void updateHtmlContent(String markdown) { // 参数改为接收markdown
    currentMarkdown = markdown;
    htmlContent = markdownToHtml(currentMarkdown, style: currentStyle); // 添加转换逻辑
    notifyListeners();
  }

  void changeStyle(MarkdownStyle newStyle) {
    currentStyle = newStyle;
    htmlContent = markdownToHtml(currentMarkdown, style: currentStyle);
    notifyListeners();
  }
}