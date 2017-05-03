import UIKit
import AVFoundation
import Flutter

@UIApplicationMain

@objc class AppDelegate: FlutterAppDelegate {
    
    var plugins:PluginRegistry?
    
    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        
        if (self.window.rootViewController as? Flutter.FlutterViewController) != nil {
            
            plugins = PluginRegistry(self.window.rootViewController as! FlutterViewController)
            
        } else {
            print("no FlutterViewController")
        }
        
        return true
    }
}
