import 'package:flutter/services.dart' show rootBundle;

Future<String> loadStringFromAssets(String filePath) async {
  return await rootBundle.loadString(filePath);
}
