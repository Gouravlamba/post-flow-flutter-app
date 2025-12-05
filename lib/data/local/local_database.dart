import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  final SharedPreferences prefs;

  LocalDatabase._(this.prefs);

  static Future<LocalDatabase> init() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalDatabase._(prefs);
  }
}
