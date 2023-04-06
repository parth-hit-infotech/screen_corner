import 'package:flutter_test/flutter_test.dart';
import 'package:screen_corner/screen_corner.dart';
import 'package:screen_corner/screen_corner_platform_interface.dart';
import 'package:screen_corner/screen_corner_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenCornerPlatform
    with MockPlatformInterfaceMixin
    implements ScreenCornerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenCornerPlatform initialPlatform = ScreenCornerPlatform.instance;

  test('$MethodChannelScreenCorner is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenCorner>());
  });

  test('getPlatformVersion', () async {
    ScreenCorner screenCornerPlugin = ScreenCorner();
    MockScreenCornerPlatform fakePlatform = MockScreenCornerPlatform();
    ScreenCornerPlatform.instance = fakePlatform;

    expect(await screenCornerPlugin.getPlatformVersion(), '42');
  });
}
