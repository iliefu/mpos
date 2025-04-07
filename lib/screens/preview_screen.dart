import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PreviewScreen extends StatelessWidget {
  final String htmlContent;

  const PreviewScreen({super.key, required this.htmlContent});

  static const routeName = '/preview';
  
  static void go(BuildContext context, String htmlContent) {
    context.push(routeName, extra: htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML 预览'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Html(
                data: htmlContent,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: htmlContent));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('已复制 HTML，可粘贴到微信订阅号助手')),
          );
        },
        tooltip: '复制 HTML',
        icon: const Icon(Icons.content_copy),
        label: const Text('复制 HTML'),
      ),
    );
  }
}