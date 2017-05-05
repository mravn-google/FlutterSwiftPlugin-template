# Flutter plugin written in swift

This is an experimental "empty" project template to write Flutter plugins in Swift ( complete example : [Flutter Audio](https://github.com/rxlabz/flutter_audio), an swift-based Flutter plugin example to play audio files).

[Documentation about Flutter plugins](https://flutter.io/platform-plugins/) and [native Apis access from Flutter](https://flutter.io/platform-channels/)



Basically, a Flutter plugin is a platform channel subscriber/pusher, packaged and shared as a Dart pub package.

There is different types of channels :

- [MethodChannel](https://docs.flutter.io/flutter/services/MethodChannel-class.html), allowing call native methods from Dart, and vice-versa.
- and [BasicMessageChannel](https://docs.flutter.io/flutter/services/BasicMessageChannel-class.html), which is an async stream between Flutter Dart code and the host platform.

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

- [AppDelegate.swift](https://github.com/rxlabz/FlutterSwiftPlugin-template/blob/master/example/ios/Runner/AppDelegate.swift) :
 the AppDelegate class only instantiate a PluginRegistry.

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

- [PluginRegistry.swift](https://github.com/rxlabz/FlutterSwiftPlugin-template/blob/master/example/ios/Runner/PluginRegistry.swift) :
 the PluginRegistry instantiate all the application plugins.
 
 Here we import the swift_plugin_poc module, to access the SwiftPluginPocPlugin class.

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

