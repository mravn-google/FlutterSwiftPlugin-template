import Foundation
import Flutter

@objc public class SwiftPluginPocPlugin:NSObject, FlutterPlugin{
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "swift_plugin_poc", binaryMessenger: registrar.messenger())
        let instance:SwiftPluginPocPlugin = SwiftPluginPocPlugin()
        registrar.addMethodCallDelegate(instance, channel:channel)
    }

    public func handle( _ call:FlutterMethodCall, result: @escaping FlutterResult ){
        if call.method == "getPlatformVersion" {
            result("iOS \(UIDevice.current.systemVersion)")
        } else {
            result( FlutterMethodNotImplemented)
        }
    }
}
