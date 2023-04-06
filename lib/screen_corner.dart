import 'package:flutter/services.dart';
import 'package:screen_corner/corner.dart';

class ScreenCorner {
  static final ScreenCorner instance = ScreenCorner._();

  factory ScreenCorner() => instance;

  ScreenCorner._();

  final methodChannel = const MethodChannel('hit:screen_corner');
  var _value = Corner(value: 0.0);

  Future<Corner?> fetchCorners() async {
    try {
      final value = await methodChannel.invokeMethod('getCorners');
      _value = Corner(value: double.tryParse(value?.toString() ?? '0.0') ?? 0.0);
      return _value;
    } catch (e) {
      return _value;
    }
  }

  Corner get corner => _value;

  double get cornerValue => corner.value;
}
