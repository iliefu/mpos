import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_state.dart';
import '../utils/markdown_styles.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    
    return PopupMenuButton<MarkdownStyle>(
      icon: const Icon(Icons.palette),
      tooltip: '选择主题',
      onSelected: (style) {
        appState.changeStyle(style);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: MarkdownStyle.standard,
          child: Text('标准主题${appState.currentStyle == MarkdownStyle.standard ? " ✓" : ""}'),
        ),
        PopupMenuItem(
          value: MarkdownStyle.compact,
          child: Text('紧凑主题${appState.currentStyle == MarkdownStyle.compact ? " ✓" : ""}'),
        ),
        PopupMenuItem(
          value: MarkdownStyle.elegant,
          child: Text('优雅主题${appState.currentStyle == MarkdownStyle.elegant ? " ✓" : ""}'),
        ),
      ],
    );
  }
}