import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_motion/flutter_motion.dart';
import 'package:flutter_motion/flutter_motion_platform_interface.dart';
import 'package:flutter_motion/flutter_motion_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMotionPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMotionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMotionPlatform initialPlatform = FlutterMotionPlatform.instance;

  test('$MethodChannelFlutterMotion is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMotion>());
  });

  test('getPlatformVersion', () async {
    FlutterMotion flutterMotionPlugin = FlutterMotion();
    MockFlutterMotionPlatform fakePlatform = MockFlutterMotionPlatform();
    FlutterMotionPlatform.instance = fakePlatform;

    expect(await flutterMotionPlugin.getPlatformVersion(), '42');
  });
}
