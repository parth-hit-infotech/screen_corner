#import "ScreenCornersPlugin.h"
#if __has_include(<screen_corners/screen_corners-Swift.h>)
#import <screen_corners/screen_corners-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "screen_corners-Swift.h"
#endif

@implementation ScreenCornersPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [ScreenCornerPlugin registerWithRegistrar:registrar];
}
@end
