//
//  NotificationCenter+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by Appnap WS02 on 25/7/24.
//

import Foundation

extension Notification.Name {
    static var appleLoginSuccess: Notification.Name {
        return .init(rawValue: "com.user.appleLogin.success") }
    static var logoutSuccess: Notification.Name {
        return .init(rawValue: "com.user.logoutOrDeleteAccount.success") }
    static var channelKickOffSuccess: Notification.Name {
        return .init(rawValue: "com.user.channelKickOff.success") }
    static var channelExitSuccess: Notification.Name {
        return .init(rawValue: "com.user.channelExit.success") }
    static var guestToAppleLoginSuccess: Notification.Name {
        return .init(rawValue: "com.user.guestToAppleLogin.success") }
}
