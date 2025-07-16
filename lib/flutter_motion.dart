
import 'flutter_motion_platform_interface.dart';

class FlutterMotion {
  Future<String?> getPlatformVersion() {
    return FlutterMotionPlatform.instance.getPlatformVersion();
  }
}
