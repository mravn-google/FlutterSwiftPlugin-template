import Foundation
import Flutter
import swift_plugin_poc

class PluginRegistry:NSObject{
    
    public func registerWithRegistry(registry:FlutterPluginRegistry){
        SwiftPluginPocPlugin.register(with:registry as! FlutterPluginRegistrar)
    }
    
}
