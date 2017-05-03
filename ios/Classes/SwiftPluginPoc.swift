//
//  SwiftPluginPoc.swift
//  Pods
//
//  Created by rx on 02/05/2017.
//
//

import Foundation
import Flutter

@objc open class SwiftPluginPocPlugin:NSObject{
    
    var channel:FlutterMethodChannel
    
    public init( controller:FlutterViewController){
        print("SwiftPluginPocPlugin")
        channel = FlutterMethodChannel(name: "swift_plugin_poc", binaryMessenger: controller)
        super.init()
        channel.setMethodCallHandler(onMethodCall)
    }
    
    public func onMethodCall( _ call:FlutterMethodCall, result:FlutterResult ){
        print("onMethodCall \(call.method)")
        if call.method == "getPlatformVersion" {
            result("iOS response \(UIDevice.current.systemVersion)")
        } else {
            result( FlutterMethodNotImplemented)
        }
    }
}
