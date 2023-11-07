import 'package:flutter/services.dart';

class SimCountryCodePlugin {
  static const MethodChannel _channel =
  MethodChannel('sim_country_code_plugin');

  static Future<String?> getSimCountryCode() async {
    final String? countryCode = await _channel.invokeMethod('getSimCountryCode');
    return countryCode;
  }
}
