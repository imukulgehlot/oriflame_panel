import 'package:go_router/go_router.dart';
import 'package:oriflame_panel/features/panel/panel_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'dashboard',
        builder: (context, state) => const PanelScreen(),
      ),
    ],
  );
}
