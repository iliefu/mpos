import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpost/widgets/webview.dart';
import 'package:provider/provider.dart';
// 确认导入路径正确
import '../utils/app_state.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showHtmlPreview = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contentSize = MediaQuery.of(context).size;
    final appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('MPost'),
        actions: [
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
        child: Stack(
          children: [
            appState.webView,
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                alignment: Alignment.topCenter,
                width: contentSize.width,
                height: contentSize.height,
                child:
                    _showHtmlPreview
                        ? WebView(htmlContent: appState.htmlContent)
                        : TextField(
                          controller: _controller,
                          maxLines: null,
                          expands: true,
                          onChanged:
                              (value) => appState.updateHtmlContent(value),
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
            ),
          ],
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
}
