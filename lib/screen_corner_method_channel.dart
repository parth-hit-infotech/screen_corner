import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_corner_platform_interface.dart';

/// An implementation of [ScreenCornerPlatform] that uses method channels.
class MethodChannelScreenCorner extends ScreenCornerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_corner');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
