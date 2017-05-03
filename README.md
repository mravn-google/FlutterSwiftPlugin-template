# swift_plugin_poc

this is an experimental template for write Flutter plugins in Swift.

[Documentation about Flutter plugins](https://flutter.io/platform-plugins/)

When you create a plugin project with flutter CLI `flutter create --plugin my_plugin`, all generated iOS files are written in ObjectiveC.

In this template, I replaced the plugin generated .h & .m files with swift 3 files.
:warning: default objectiveC plugin are static libraries. To use swift you need to change to `dynamic library` in the Pods_Runner build settings.

The plugin main file is [/ios/Classes/SwiftPluginPoc.swift](https://github.com/rxlabz/FlutterSwiftPlugin-template/blob/master/ios/Classes/SwiftPluginPoc.swift) 

```swift
import Foundation
import Flutter

@objc public class SwiftPluginPocPlugin:NSObject{
    
    var channel:FlutterMethodChannel
    
    public init( controller:FlutterViewController){
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

```

I also replaced all the example project files : 

- [AppDelegate.swift](https://github.com/rxlabz/FlutterSwiftPlugin-template/blob/master/example/ios/Runner/AppDelegate.swift)

```swift
import UIKit
import AVFoundation
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  var plugins: PluginRegistry?

  override func application(_ application: UIApplication,
                            didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {

    guard let flutterController = self.window.rootViewController as? Flutter.FlutterViewController else {
      print("no FlutterViewController")
      return true
    }

    plugins = PluginRegistry(flutterController)

    return true
  }
}

```

- [PluginRegistry.swift](https://github.com/rxlabz/FlutterSwiftPlugin-template/blob/master/example/ios/Runner/PluginRegistry.swift)

```swift
import Foundation
import Flutter
import swift_plugin_poc

class PluginRegistry:NSObject{
    
    var swift_plugin_poc:SwiftPluginPocPlugin
    
    init(withController controller:FlutterViewController){
        swift_plugin_poc = SwiftPluginPocPlugin(withController:controller)
    }
}

```

