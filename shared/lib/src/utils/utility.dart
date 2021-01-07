import 'dart:ui';

import 'package:core/core.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:logger/logger.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

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

  /// Returns future bool value depending on the internet
  /// connectivity.
  static Future<bool> isNetworkAvailable() async =>
      await DataConnectionChecker().hasConnection;

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Show no internet dialog if there is no
  /// internet available.
  static void showNoInternetDialog() {
    closeDialog();
    Get.dialog<void>(
      Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: Dimens.padding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConstants.noInternet,
                textAlign: TextAlign.center,
                style: Styles.boldWhite23,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Show an error snack bar.
  ///
  /// [message] : error message.
  static void showError(String message) {
    closeDialog();
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: Styles.white16,
      ),
      mainButton: FlatButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          StringConstants.okay,
          style: Styles.white14,
        ),
      ),
      backgroundColor: Colors.red,
      margin: Dimens.padding15,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Open the url if its a valid link.
  static void openUrl(String title) async {
    if (await canLaunch('https://en.wikipedia.org/wiki/$title')) {
      Get.find<LocalRepository>().storeData(LocalKeys.clickedValue, title);
      await launch('https://en.wikipedia.org/wiki/$title');
    }
  }

  static void openHistoryPage() {
    var history =
        Get.find<LocalRepository>().getListStringValue(LocalKeys.clickedValue);
    Get.bottomSheet<void>(
      Scaffold(
        appBar: AppBar(
          leading: const CloseButton(
            color: Colors.black,
          ),
          title: Text(
            StringConstants.history,
            style: Styles.black18,
          ),
          backgroundColor: Colors.white,
        ),
        body: (history.isNotEmpty)
            ? SizedBox(
                height: Dimens.fiftyPercent,
                child: ListView.builder(
                  padding: Dimens.padding5,
                  shrinkWrap: true,
                  itemCount: history.length,
                  itemBuilder: (_, position) => SingleSearchedItem(
                    history[position],
                    '',
                    '',
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Icon(
                    Icons.history,
                    color: Colors.black,
                    size: Dimens.fifteenPercent,
                  ),
                ),
              ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
