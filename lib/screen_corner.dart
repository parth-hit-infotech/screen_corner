import 'screen_corner_platform_interface.dart';

class ScreenCorner {
  Future<String?> getPlatformVersion() {
    return ScreenCornerPlatform.instance.getPlatformVersion();
  }

  static final ScreenCorner _instance = ScreenCorner._();

  factory ScreenCorner() => _instance;

  ScreenCorner._();

  static Future<CornerValue?> initScreenCorners() {
    return ScreenCornersPlatform.instance.initScreenCorners();
  }

  static CornerValue get corner => ScreenCornersPlatform.instance.getValue();

  static double get cornerValue => corner.value;
}
