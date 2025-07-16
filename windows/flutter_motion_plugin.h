#ifndef FLUTTER_PLUGIN_FLUTTER_MOTION_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MOTION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_motion {

class FlutterMotionPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMotionPlugin();

  virtual ~FlutterMotionPlugin();

  // Disallow copy and assign.
  FlutterMotionPlugin(const FlutterMotionPlugin&) = delete;
  FlutterMotionPlugin& operator=(const FlutterMotionPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_motion

#endif  // FLUTTER_PLUGIN_FLUTTER_MOTION_PLUGIN_H_
