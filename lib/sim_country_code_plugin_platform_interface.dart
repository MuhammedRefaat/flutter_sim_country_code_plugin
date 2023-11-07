import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sim_country_code_plugin_method_channel.dart';

abstract class SimCountryCodePluginPlatform extends PlatformInterface {
  /// Constructs a SimCountryCodePluginPlatform.
  SimCountryCodePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SimCountryCodePluginPlatform _instance = MethodChannelSimCountryCodePlugin();

  /// The default instance of [SimCountryCodePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSimCountryCodePlugin].
  static SimCountryCodePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimCountryCodePluginPlatform] when
  /// they register themselves.
  static set instance(SimCountryCodePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
