//
//  GeneratedPluginRegistrant.swift
//  Runner
//
//  Created by rx on 12/05/2017.
//  Copyright © 2017 The Chromium Authors. All rights reserved.
//

import Foundation
import swift_plugin_poc

class GeneratedPluginRegistrant:NSObject{
    
    public func registerWithRegistry(registry:FlutterPluginRegistry){
        SwiftPluginPocPlugin.register(with:registry.registrar(forPlugin: "SwiftPluginPocPlugin"))
    }
    
}
