import 'dart:ui';

import 'package:intl/intl.dart' as intl;
import 'package:logger/logger.dart';
import 'package:shared/shared.dart';

/// A chunk of methods which can be used to
/// the common operations performed everywhere
/// in the application.
abstract class Utility {
  /// Print debug log.
  ///
  /// [message] : The message which needed to be print.
  static void printDLog(String message) {
    Logger()..d('${StringConstants.appName} $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger()..i('${StringConstants.appName} $message');
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger()..e('${StringConstants.appName} $message');
  }

  /// Returns [TextDirection.rtl] if the current locale has RTL support.
  static TextDirection isDirectionRTL(String languageCode) {
    if (intl.Bidi.isRtlLanguage(languageCode)) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }
}
