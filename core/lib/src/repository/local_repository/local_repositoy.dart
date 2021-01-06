import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A local repository class which will help us to connect to the
/// local database and get the data from there and will be only be
/// used if the data is needed in the future and will change only due to
/// some reason in the future. If its required for a single application launch
/// then constants can be used instead of local storage. Will also be used as
/// a cache mechanism if the data is not available from the remote.
class LocalRepository {
  Future<void> init() async {
    _sharedPreference ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences _sharedPreference;

  /// Returns the string values for the [key]
  String getStringValue(String key) {
    if (key == LocalKeys.localLang) {
      return _sharedPreference.getString(key) ?? NetworkConstants.defaultLang;
    }
    return _sharedPreference.getString(key) ?? '';
  }
}
