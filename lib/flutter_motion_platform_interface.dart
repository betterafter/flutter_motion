import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_motion_method_channel.dart';

abstract class FlutterMotionPlatform extends PlatformInterface {
  /// Constructs a FlutterMotionPlatform.
  FlutterMotionPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMotionPlatform _instance = MethodChannelFlutterMotion();

  /// The default instance of [FlutterMotionPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMotion].
  static FlutterMotionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMotionPlatform] when
  /// they register themselves.
  static set instance(FlutterMotionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
