#include "include/flutter_motion/flutter_motion_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_motion_plugin.h"

void FlutterMotionPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_motion::FlutterMotionPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
