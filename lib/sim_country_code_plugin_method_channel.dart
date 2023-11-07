import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sim_country_code_plugin_platform_interface.dart';

/// An implementation of [SimCountryCodePluginPlatform] that uses method channels.
class MethodChannelSimCountryCodePlugin extends SimCountryCodePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sim_country_code_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
