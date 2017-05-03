# swift_plugin_poc

this is an experimental template for write Flutter plugins in Swift.

[Documentation about Flutter plugins](https://flutter.io/platform-plugins/)

When you create a plugin project with flutter CLI `flutter create --plugin my_plugin`, all generated iOS files are written in ObjectiveC.

In this template, I replaced the plugin generated .h & .m files with swift 3 files.

- /ios/Classes/SwiftPluginPoc.swift is the plugin main file

I also replaced all the example project files : 

- AppDelegate.swift
- PluginRegistry.swift


:warning: default objectiveC plugin are static libraries. To use swift you need to change to `dynamic library` in the Pods_Runner build settings.