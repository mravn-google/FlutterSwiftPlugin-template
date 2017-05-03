//
//  PluginRegistry.swift
//  Runner
//
//  Created by rx on 02/05/2017.
//  Copyright © 2017 The Chromium Authors. All rights reserved.
//


import Foundation
import Flutter
import swift_plugin_poc


class PluginRegistry:NSObject{
    
    var swift_plugin_poc:SwiftPluginPocPlugin;
    
    init(_ withController:FlutterViewController){
        swift_plugin_poc = SwiftPluginPocPlugin(controller:withController)
    }
    
}
