package com.yourcompany.swift_plugin_poc;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;

/**
 * SwiftPluginPocPlugin
 */
public class SwiftPluginPocPlugin implements MethodCallHandler {
  private FlutterActivity activity;

  public static SwiftPluginPocPlugin register(FlutterActivity activity) {
    return new SwiftPluginPocPlugin(activity);
  }

  private SwiftPluginPocPlugin(FlutterActivity activity) {
    this.activity = activity;
    new MethodChannel(activity.getFlutterView(), "swift_plugin_poc").setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }
}
