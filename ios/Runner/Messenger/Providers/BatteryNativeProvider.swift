//
//  BatteryNativeProvider.swift
//  Runner
//
//  Created by nice2meet on 2023/8/11.
//

import UIKit

class BatteryNativeProvider: NativeMethodProviderAble {
    var name: String {
        return NativeMessenger.Method.getBatteryLevel.rawValue
    }
    
    func call(result: @escaping (Any?) -> Void) {
        receiveBatteryLevel(result: result)
    }
    
    func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(Int(device.batteryLevel * 100))
            
            //        result(FlutterError(code: "UNAVAILABLE",
            //                            message: "Battery level not available.",
            //                            details: nil))
        } else {
            result(Int(device.batteryLevel * 100))
        }
    }
    
}
