import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mpost/local_service.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class AppState extends ChangeNotifier {
  String htmlContent = '';
  String currentMarkdown = '';

  late final WebViewControllerPlus controllerPlus;

  late final WebViewWidget webView;

  AppState() {
    try {
      controllerPlus =
          WebViewControllerPlus()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..loadFlutterAssetWithServer(
              'assets/web/index.html',
              localhostServer.port!,
            );

      webView = WebViewWidget(controller: controllerPlus);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> renderMarkdownToHtml(String markdown) async {
    try {
      final hl = await controllerPlus.runJavaScriptReturningResult(
        "renderMarkdownToHtml(${jsonEncode(markdown)}, 0)",
      );
      return hl.toString();
    } catch (e) {
      print(e);
      return null;
    }
  }

  void updateHtmlContent(String markdown) async {
    // 参数改为接收markdown
    currentMarkdown = markdown;
    htmlContent = (await renderMarkdownToHtml(currentMarkdown)) ?? ''; // 添加转换逻辑
    notifyListeners();
  }
}
