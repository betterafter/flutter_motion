import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_motion_platform_interface.dart';

/// An implementation of [FlutterMotionPlatform] that uses method channels.
class MethodChannelFlutterMotion extends FlutterMotionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_motion');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
