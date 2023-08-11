//
//  NativeMessenger.swift
//  Runner
//
//  Created by nice2meet on 2023/8/11.
//

import UIKit

protocol NativeMethodProviderAble {
    var name: String { get }
    func call(result: @escaping FlutterResult) -> Void
}

class NativeMessenger {
    static let shared = NativeMessenger()
    
    enum Method: String {
        case getBatteryLevel
        case notificationServiceGetAccess
    }
    
    enum Channel: String {
        case methondChannel = "fapp.flutter/methodChannel"
        case eventChannel
    }
    
    func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let method = Method.init(rawValue: call.method) else {
            result(FlutterMethodNotImplemented)
            return
        }
        switch method {
        case .getBatteryLevel:
            batteryProvider.call(result: result)
        case .notificationServiceGetAccess:
            notificationSerivceProvider.call(result: result)
        }
    }
    
}

extension NativeMessenger {
    var batteryProvider: NativeMethodProviderAble {
        return BatteryNativeProvider()
    }
    
    var notificationSerivceProvider: NativeMethodProviderAble {
        return NotificationServiceAccessProvider()
    }
}
