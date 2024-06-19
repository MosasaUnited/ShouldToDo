import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/theming/theme_data_style.dart';

class ShouldToDo extends StatelessWidget {
  const ShouldToDo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp.router(
        title: 'Should ToDo App',
        themeMode: ThemeMode.system,
        theme: ThemeDataStyle.light,
        darkTheme: ThemeDataStyle.dark,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
