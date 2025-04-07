import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
// 确认导入路径正确
import '../utils/app_state.dart';

import '../widgets/theme_selector.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showHtmlPreview = false;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('WeMark'),
        actions: [
          if (_showHtmlPreview) // 仅在预览模式显示主题选择器
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: ThemeSelector(),
            ),
          IconButton(
            icon: Icon(
              _showHtmlPreview ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed:
                () => setState(() => _showHtmlPreview = !_showHtmlPreview),
          ),
        ],
      ),
      body: SafeArea(
        child:
            _showHtmlPreview
                ? SingleChildScrollView(child: Html(data: appState.htmlContent))
                : TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  onChanged: (value) => appState.updateHtmlContent(value),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '开始输入Markdown内容...',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                  ),
                ),
      ),

      floatingActionButton:
          _showHtmlPreview
              ? FloatingActionButton(
                heroTag: 'copy',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: appState.htmlContent));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('已复制HTML内容')));
                },
                child: const Icon(Icons.content_copy),
              )
              : null,
    );
  }

  void showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('选择主题'),
            content: const ThemeSelector(),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('关闭'),
              ),
            ],
          ),
    );
  }
}
