import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                const Text(
                  'Light / Dark Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                const Spacer(),
                // Switch(
                //   value: BlocProvider.of<AppThemeCubit>(context).state ==
                //       ThemeState.Light,
                //   onChanged: (value) {
                //     BlocProvider.of<AppThemeCubit>(context).changeTheme(
                //         value ? ThemeState.Light : ThemeState.Dark);
                //   },
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
