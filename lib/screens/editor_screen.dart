import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../utils/markdown_converter.dart';
import '../utils/app_state.dart';
import '../widgets/theme_selector.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isPreviewVisible = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateMarkdown);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateMarkdown);
    _controller.dispose();
    super.dispose();
  }

  void _updateMarkdown() {
    context.read<AppState>().updateMarkdown(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeMark - Markdown编辑器'),
        actions: [
          // 主题选择器
          const ThemeSelector(),
          
          // 预览切换
          IconButton(
            icon: Icon(_isPreviewVisible ? Icons.visibility : Icons.visibility_off),
            tooltip: _isPreviewVisible ? '隐藏预览' : '显示预览',
            onPressed: () {
              setState(() {
                _isPreviewVisible = !_isPreviewVisible;
              });
            },
          ),
          
          // HTML预览
          IconButton(
            icon: const Icon(Icons.html),
            tooltip: '查看HTML',
            onPressed: () {
              final html = markdownToHtml(
                _controller.text,
                style: appState.currentStyle,
              );
              context.push('/preview', extra: html);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 编辑区域
          Expanded(
            flex: _isPreviewVisible ? 1 : 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: '粘贴或输入Markdown内容...',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 16, height: 1.8),
              ),
            ),
          ),
          
          // 分隔线
          if (_isPreviewVisible) const Divider(height: 1),
          
          // 预览区域
          if (_isPreviewVisible)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Markdown(
                  data: _controller.text,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(fontSize: 16, height: 1.8),
                    h1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    h2: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    h3: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    code: const TextStyle(
                      backgroundColor: Color(0xFFEEEEEE),
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final html = markdownToHtml(
            _controller.text,
            style: appState.currentStyle,
          );
          context.push('/preview', extra: html);
        },
        icon: const Icon(Icons.preview),
        label: const Text('预览HTML'),
      ),
    );
  }
}