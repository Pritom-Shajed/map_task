import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  Environment._();

  static String get fileName {
    if(kReleaseMode){
      return '.env.production';
    } else {
      return '.env.development';
    }
  }
  static String get baseApiUrl {
    return dotenv.env['BASEURL'] ?? 'API URL NOT FOUND';
  }

  static String get apiKey {
    return dotenv.env['API_KEY'] ?? 'API URL NOT FOUND';
  }

  static String get mapUrl {
    return dotenv.env['MAP_URL'] ?? 'API URL NOT FOUND';
  }

}