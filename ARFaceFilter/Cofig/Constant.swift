//
//  Constant.swift
//  WalkiTalki-Redesign
//
//  Created by Lutful Kabir on 20/2/24.
//

import Foundation
import UIKit

// MARK: - Screen Size (context-derived; avoids deprecated UIScreen.main)
// We derive the current screen from the application's connected window scenes,
// prioritizing the foreground active scene. This avoids the deprecated UIScreen.main
// and better supports multi-window environments.
private func _activeScreenBounds() -> CGRect {
    let scenes = UIApplication.shared.connectedScenes
    if let windowScene = scenes
        .compactMap({ $0 as? UIWindowScene })
        .first(where: { $0.activationState == .foregroundActive }) {
        return windowScene.screen.bounds
    }
    if let anyScene = scenes.compactMap({ $0 as? UIWindowScene }).first {
        return anyScene.screen.bounds
    }
    return .zero
}

var SCREEN_SIZE: CGRect { _activeScreenBounds() }
var SCREEN_HEIGHT: CGFloat { SCREEN_SIZE.height }
var SCREEN_WIDTH: CGFloat { SCREEN_SIZE.width }

var SCALE_HEIGHT: CGFloat { SCREEN_HEIGHT / 896 }
var SCALE_WIDTH: CGFloat { SCREEN_WIDTH / 414 }

//MARK: - TabBar Height
var MAIN_TAB_HEIGHT: CGFloat { 98 * SCALE_HEIGHT }

//MARK: - App Fonts
struct Fonts {
    static let archivoRegular = "Archivo-Regular"
    static let archivoBold = "Archivo-Bold"
    static let archivoSemiBold = "Archivo-SemiBold"
    static let archivoBlack = "Archivo-Black"
    static let archivoExtraBold = "Archivo-ExtraBold"
    static let archivoExtraLight = "Archivo-ExtraLight"
    static let archivoLight = "Archivo-Light"
    static let archivoMedium = "Archivo-Medium"
    static let archivoThin = "Archivo-Thin"
    static let pocketCalculator = "PocketCalculator"
    static let soraRegular = "Sora-Regular"
    static let soraBold = "Sora-Bold"
    static let soraExtraBold = "Sora-ExtraBold"
    static let soraExtraLight = "Sora-ExtraLight"
    static let soraLight = "Sora-Light"
    static let soraThin = "Sora-Thin"
    static let soraSemiBold = "Sora-SemiBold"
    static let soraMedium = "Sora-Medium"
    static let azeretMonoLight = "AzeretMono-Light"
    static let azeretMonoRegular = "AzeretMono-Regular"
    static let azeretMonoMedium = "AzeretMono-Medium"
    static let azeretMonoSemiBold = "AzeretMono-SemiBold"
    static let spaceGroteskRegular = "SpaceGrotesk-Regular"
    static let spaceGroteskMedium = "SpaceGrotesk-Medium"
    static let spaceGroteskLight = "SpaceGrotesk-Light"
    static let spaceGroteskBold = "SpaceGrotesk-Bold"
    static let digital7 = "Digital-7"
    static let pixeloidMono = "PixeloidMono"
    static let IBMPlexMono = "IBMPlexMono-Regular"
    static let VCROSDMono = "VCROSDMono"
    static let Flight = "Flight"
}

var DISCOUNTED_TIMER: Double = 300
var IMAGE_TO_UPLOAD: UIImage?

let MESSAGE_CHARACTER_LIMIT = 1500
let PHONE_NUMBER_LENGTH = 15
