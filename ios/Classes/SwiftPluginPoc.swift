/*import Foundation
import Flutter

@objc public class SwiftPluginPocPlugin:NSObject{
    
    var channel:FlutterMethodChannel
    
    public init(withController controller:FlutterViewController){
        channel = FlutterMethodChannel(name: "swift_plugin_poc", binaryMessenger: controller)
        super.init()
        channel.setMethodCallHandler(onMethodCall)
    }
    
    public func onMethodCall( _ call:FlutterMethodCall, result:FlutterResult ){
        if call.method == "getPlatformVersion" {
            result("iOS response : \(UIDevice.current.systemVersion)")
        } else {
            result( FlutterMethodNotImplemented)
        }
    }
}*/

import Foundation
import Flutter

@objc public class SwiftPluginPocPlugin:NSObject{
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "swift_plugin_poc", binaryMessenger: registrar.messenger())
        let instance:SwiftPluginPocPlugin  = SwiftPluginPocPlugin()
        registrar.addMethodCallDelegate(instance as! FlutterPlugin, channel:channel)
    }
    
    public func handle( _ call:FlutterMethodCall, result:FlutterResult ){
        if call.method == "getPlatformVersion" {
            result("iOS response : \(UIDevice.current.systemVersion)")
        } else {
            result( FlutterMethodNotImplemented)
        }
    }
}

