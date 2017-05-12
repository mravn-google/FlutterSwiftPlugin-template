import Foundation
import Flutter
import swift_plugin_poc

class GeneratedPluginRegistrant:NSObject{
    
    public func registerWithRegistry(registry:FlutterPluginRegistry){
        SwiftPluginPocPlugin.register(with:registry as! FlutterPluginRegistrar)
    }
    
}
