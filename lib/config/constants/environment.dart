

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String baseUrl = dotenv.env['BASE_URL'] ?? 'No base url';
  static String apiKey = dotenv.env['API_KEY'] ?? 'No api key';
  static String imageNotAvailable = 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg';
}