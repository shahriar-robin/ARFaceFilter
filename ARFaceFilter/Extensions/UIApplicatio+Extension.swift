//
//  UIApplicatio+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by Appnap WS02 on 14/5/24.
//

import UIKit

extension UIApplication {
    
    static func jsonString(from object:Any) -> String? {
        
        guard let data = jsonData(from: object) else {
            return nil
        }
        
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    static func jsonData(from object:Any) -> Data? {
        
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return data
    }
}

class SocketParser {
    
    static func convert<T: Decodable>(data: Any) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: jsonData)
    }
    
    static func convert<T: Decodable>(datas: [Any]) throws -> [T] {
        return try datas.map { (dict) -> T in
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData)
        }
    }
    
}

//Haptic
struct HapticGenerator {
    //soft
    static func softImpact() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
    //light
    static func lightImpact() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    //medium
    static func mediumImpact() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    //heavy
    static func heavyImpact() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
    }
}


///Device check
extension UIDevice {
    static var isIpad : Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

//MARK: - topMostViewController
extension UIApplication {
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
}
