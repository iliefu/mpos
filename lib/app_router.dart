import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/editor_screen.dart';
import 'screens/preview_screen.dart';
import 'utils/markdown_converter.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/editor',
      name: 'editor',
      builder: (context, state) => const EditorScreen(),
    ),
    GoRoute(
      path: '/preview',
      name: 'preview',
      builder: (context, state) {
        final htmlContent = state.extra as String;
        return PreviewScreen(htmlContent: htmlContent);
      },
    ),
  ],
  initialLocation: '/editor',
);