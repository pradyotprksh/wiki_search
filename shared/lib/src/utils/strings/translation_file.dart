import 'package:get/get.dart';

/// The main translation file which will help
/// in localization of the application
///
/// [keys] : Contains all the language code which will be
/// used in the application
///
/// For more details on how to implement localization
/// can go to [GetX Internationalization](https://pub.dev/packages/get#internationalization)
/// and read there documentation.
class TranslationsFile extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'somethingWentWrong': 'Oops!! Something went wrong.',
          'search': 'Search',
          'pageNotFound': '404!!',
          'okay': 'Okay',
          'noInternet':
              'You are not connected to the internet. Please enable internet to start using the application',
        },
      };
}
