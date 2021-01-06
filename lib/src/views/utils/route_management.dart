import 'package:WikiSearch/src/views/views.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
abstract class RouteManagement {
  static void goToSearchScreen() {
    Get.off<void>(
      SearchScreen(),
      transition: Transition.fadeIn,
    );
  }
}
