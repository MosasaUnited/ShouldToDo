import 'package:go_router/go_router.dart';
import 'package:should_todo/features/home/ui/screens/home_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    )
  ]);
}
