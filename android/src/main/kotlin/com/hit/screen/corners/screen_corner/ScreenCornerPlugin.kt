package com.hit.screen.corners.screen_corner

import android.os.Build
import android.view.RoundedCorner
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ScreenCornerPlugin */
class ScreenCornerPlugin : FlutterActivity() {
//    private lateinit var channel: MethodChannel
    private val CHANNEL = "hit:screen_corner";

//    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//        channel = MethodChannel(flutterPluginBinding.binaryMessenger)
//        channel.setMethodCallHandler(this)
//    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getCorners") {
                val borderRadius = getScreenCorners()
                if (borderRadius != null) {
                    result.success(borderRadius)
                } else {
                    result.error(
                        "UNAVAILABLE",
                        "Border radius fetching is only supported from API 33 only!",
                        null
                    )
                }
            } else {
                result.notImplemented()
            }
        }
    }

//    override fun onMethodCall(call: MethodCall, result: Result) {
//        if (call.method == "getCorners") {
//            val borderRadius = getScreenCorners()
//            if (borderRadius != null) {
//                result.success(borderRadius)
//            } else {
//                result.error(
//                    "UNAVAILABLE",
//                    "Border radius fetching is only supported from API 33 only!",
//                    null
//                )
//            }
//        } else {
//            result.notImplemented()
//        }
//    }

    private fun getScreenCorners(): Float? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            window.decorView.rootWindowInsets.getRoundedCorner(RoundedCorner.POSITION_TOP_RIGHT)?.radius?.div(
                resources.displayMetrics.density
            )
        } else {
            return null
        }
    }

//    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
//        channel.setMethodCallHandler(null)
//    }
}
