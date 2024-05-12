import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:should_todo/core/theming/lottie_assets.dart';

import '../../core/routing/app_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                Lottie.asset(AppLottieAssets.onBoardingAnimated),
                SizedBox(
                  height: 30.h,
                ),
                // const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Feeling overwhelmed with tasks?',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                                text: ' ShouldTodo',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.amber)),
                            TextSpan(
                              text:
                                  '  helps you to create, manage, and conquer your to-do list in a simple and effective way',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kHome);
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
