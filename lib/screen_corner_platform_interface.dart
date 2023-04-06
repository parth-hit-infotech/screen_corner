import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_corner_method_channel.dart';

abstract class ScreenCornerPlatform extends PlatformInterface {
  /// Constructs a ScreenCornerPlatform.
  ScreenCornerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenCornerPlatform _instance = MethodChannelScreenCorner();

  /// The default instance of [ScreenCornerPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenCorner].
  static ScreenCornerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenCornerPlatform] when
  /// they register themselves.
  static set instance(ScreenCornerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
