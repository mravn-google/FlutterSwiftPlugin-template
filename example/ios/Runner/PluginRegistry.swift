import Foundation
import Flutter
import swift_plugin_poc

class PluginRegistry:NSObject{
    
    var swift_plugin_poc:SwiftPluginPocPlugin
    
    init(withController controller:FlutterViewController){
        swift_plugin_poc = SwiftPluginPocPlugin(withController:controller)
    }
}
