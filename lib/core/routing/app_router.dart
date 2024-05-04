import 'package:go_router/go_router.dart';
import 'package:should_todo/features/home/home_screen.dart';

import '../../features/archive/archived_tasks.dart';
import '../../features/done/done_tasks.dart';
import '../../features/tasks/tasks.dart';

abstract class AppRouter {
  static const kHome = '/';
  static const kDoneTasks = '/Done';
  static const kTasks = '/Tasks';
  static const kArchivedTasks = '/Archived';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kHome,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: kDoneTasks,
      builder: (context, state) => const DoneTasks(),
    ),
    GoRoute(
      path: kTasks,
      builder: (context, state) => const Tasks(),
    ),
    GoRoute(
      path: kArchivedTasks,
      builder: (context, state) => const ArchivedTasks(),
    ),
  ]);
}
