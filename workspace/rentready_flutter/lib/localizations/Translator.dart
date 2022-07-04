import 'package:get/get.dart';

// Helper singleton class to handle internationalization. Helps hiding underlying
// Localization implementation (currently using GetX localization package)
class Translator {
  // Setup singleton instance
  static Translator instance = Translator._internal();
  Translator._internal();

  // Constructor to return cached instance every time
  factory Translator() {
    return instance;
  }

  // Get translated text for current selected locale
  String getText(String key) {
    return key.tr;
  }
}
