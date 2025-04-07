import 'package:go_router/go_router.dart';
import 'screens/editor_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/editor',
      name: 'editor',
      builder: (context, state) => const EditorScreen(),
    ),
  ],
  initialLocation: '/editor',
);