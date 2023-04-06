import Flutter
import UIKit

extension UIScreen {
  public var displayCornerRadius: CGFloat {
      guard let cornerRadius = self.value(forKey:"_displayCornerRadius") as? CGFloat else {
          return 0
      }
      return cornerRadius
  }
}


public class ScreenCornerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hit:screen_corner", binaryMessenger: registrar.messenger())
    let instance = ScreenCornerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  switch call.method {
    case "getCorners":
      result(UIScreen.main.displayCornerRadius)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
