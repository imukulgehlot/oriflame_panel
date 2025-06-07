import 'package:go_router/go_router.dart';
import 'package:oriflame_panel/features/panel/panel_screen.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/archived_review_accounts_tab.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'dashboard',
        builder: (context, state) => const PanelScreen(),
      ),
      GoRoute(
        path: '/archived_review_accounts_tab',
        name: 'ArchivedReviewAccountsTab',
        builder: (context, state) => const ArchivedReviewAccountsTab(),
      ),
    ],
  );
}
