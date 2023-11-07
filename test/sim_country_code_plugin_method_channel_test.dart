import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sim_country_code_plugin/sim_country_code_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSimCountryCodePlugin platform = MethodChannelSimCountryCodePlugin();
  const MethodChannel channel = MethodChannel('sim_country_code_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
