import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      setupMessenger()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func setupMessenger() {
        guard let controller : FlutterViewController = window?.rootViewController as? FlutterViewController else {
            print("setupMessenger:guard let failure")
            return
        }
        let batteryChannel = FlutterMethodChannel.init(name: NativeMessenger.Channel.methondChannel.rawValue, binaryMessenger: controller.binaryMessenger)
        batteryChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            NativeMessenger.shared.handle(call: call, result: result)
        }
    }

    
}
