import 'package:WikiSearch/src/views/views.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// The initial page which will be shown when
/// the application starts.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: TyperAnimatedTextKit(
            totalRepeatCount: 1,
            speed: const Duration(milliseconds: 200),
            text: [
              StringConstants.appName,
            ],
            repeatForever: false,
            textStyle: Styles.boldAppColor30,
            onFinished: () {
              RouteManagement.goToSearchScreen();
            },
          ),
        ),
      );
}
