import Foundation
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
}
