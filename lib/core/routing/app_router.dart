import 'package:go_router/go_router.dart';
import 'package:should_todo/features/home/home.dart';
import 'package:should_todo/features/settings/settings_screen.dart';

import '../../features/done/todo_tasks.dart';
import '../../features/done/ui/screens/edit_screen.dart';
import '../../features/done_tasks/done_tasks.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/tasks/add_tasks.dart';

abstract class AppRouter {
  static const kOnboarding = '/';
  static const kDoneTasks = '/Done';
  static const kTasks = '/Tasks';
  static const kArchivedTasks = '/Archived';
  static const kEditTasks = '/Edit';
  static const kHome = '/Home';
  static const kSettings = '/Settings';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kOnboarding,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: kDoneTasks,
      builder: (context, state) => const ToDoTasks(),
    ),
    GoRoute(
      path: kTasks,
      builder: (context, state) => const AddTasks(),
    ),
    GoRoute(
      path: kArchivedTasks,
      builder: (context, state) => const DoneTasks(),
    ),
    GoRoute(
      path: kEditTasks,
      builder: (context, state) => const EditTasks(),
    ),
    GoRoute(
      path: kHome,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: kSettings,
      builder: (context, state) => const SettingsScreen(),
    ),
  ]);
}
