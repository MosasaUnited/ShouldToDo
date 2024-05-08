import 'package:go_router/go_router.dart';

import '../../features/archive/archived_tasks.dart';
import '../../features/done/done_tasks.dart';
import '../../features/edit/edit_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/tasks/tasks.dart';

abstract class AppRouter {
  static const kOnboarding = '/';
  static const kDoneTasks = '/Done';
  static const kTasks = '/Tasks';
  static const kArchivedTasks = '/Archived';
  static const kEditTasks = '/Edit';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kOnboarding,
      builder: (context, state) => const OnBoardingScreen(),
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
    GoRoute(
      path: kEditTasks,
      builder: (context, state) => const EditTasks(),
    ),
  ]);
}
