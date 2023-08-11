//
//  NotificationServiceProvider.swift
//  Runner
//
//  Created by nice2meet on 2023/8/11.
//

import NotificationCenter
import UIKit

class NotificationServiceProvider: NSObject {
}

final class NotificationServiceAccessProvider: NotificationServiceProvider {
}

extension NotificationServiceAccessProvider: NativeMethodProviderAble{
    var name: String {
        return NativeMessenger.Method.notificationServiceGetAccess.rawValue
    }
    
    func call(result: @escaping FlutterResult) {
        
        let authOptions: UNAuthorizationOptions = UNAuthorizationOptions.init(rawValue: UNAuthorizationOptions.sound.rawValue | UNAuthorizationOptions.alert.rawValue | UNAuthorizationOptions.badge.rawValue)
        
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
            if let _ = error {
                result(FlutterError(code: "channel.NotificationServiceAccessProvider", message: "fetch access state failed", details: nil))
                return
            }
            result(granted)
        }
    }
}
