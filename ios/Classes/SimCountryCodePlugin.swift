import Flutter
import UIKit
import CoreTelephony

@objc(SimCountryCodePlugin)
public class SwiftSimCountryCodePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "sim_country_code_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftSimCountryCodePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getSimCountryCode" {
            if let carrier = CTTelephonyNetworkInfo().subscriberCellularProvider {
                if let countryCode = carrier.isoCountryCode {
                    result(countryCode)
                } else {
                    result(nil)
                }
            } else {
                result(nil)
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
