import 'package:flutter_test/flutter_test.dart';
import 'package:sim_country_code_plugin/sim_country_code_plugin.dart';
import 'package:sim_country_code_plugin/sim_country_code_plugin_platform_interface.dart';
import 'package:sim_country_code_plugin/sim_country_code_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSimCountryCodePluginPlatform
    with MockPlatformInterfaceMixin
    implements SimCountryCodePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SimCountryCodePluginPlatform initialPlatform = SimCountryCodePluginPlatform.instance;

  test('$MethodChannelSimCountryCodePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSimCountryCodePlugin>());
  });

  test('getPlatformVersion', () async {
    SimCountryCodePlugin simCountryCodePlugin = SimCountryCodePlugin();
    MockSimCountryCodePluginPlatform fakePlatform = MockSimCountryCodePluginPlatform();
    SimCountryCodePluginPlatform.instance = fakePlatform;

    expect(await simCountryCodePlugin.getPlatformVersion(), '42');
  });
}
