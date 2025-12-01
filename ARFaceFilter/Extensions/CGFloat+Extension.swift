//
//  CGFloat+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by Appnap WS04 on 28/2/24.
//

import UIKit

///
extension CGFloat{
    init(w: CGFloat, for h: CGFloat = 0){
        if UIDevice.current.userInterfaceIdiom == .pad { //iPad 10.2 (8th Gen): 810 ╳ 1080
            if h > 0{
                self.init(.init(h: h) * w / h)
            }else{
                self.init(w / 810 * UIScreen.main.bounds.size.width)
            }
        }else{
            if h > 0{
                self.init(.init(h: h) * w / h)
            }else{
                self.init(w / 414 * UIScreen.main.bounds.size.width)
            }
        }
    }
    
    init(h: CGFloat, for w: CGFloat = 0){
        if UIDevice.current.userInterfaceIdiom == .pad { //iPad 10.2 (8th Gen): 810 ╳ 1080
            if w > 0{
                self.init(.init(w: w) * h / w)
            }else{
                self.init(h / 1080 * UIScreen.main.bounds.size.height)
            }
        }else{
            if w > 0{
                self.init(.init(w: w) * h / w)
            }else{
                self.init(h / 896 * UIScreen.main.bounds.size.height)
            }
        }
    }
}

extension CGFloat {
    
    // MARK: - For Width Modifier
    init(width: (pad: CGFloat, phone: CGFloat), height: (pad: CGFloat, phone: CGFloat) = (0, 0)) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if height.pad > 0 {
                self.init(.init(height: height.pad) * width.pad / height.pad)
            } else {
                self.init(width.pad / 1024 * UIScreen.main.bounds.size.width)
            }
        } else {
            if height.phone > 0 {
                self.init(.init(height: height.phone) * width.phone / height.phone)
            } else {
                self.init(width.phone / 414 * UIScreen.main.bounds.size.width)
            }
        }
    }
    
    init(width: CGFloat, for height: CGFloat = 0) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if height > 0 {
                self.init(.init(height: height) * width / height)
            } else {
                self.init(width / 1024 * UIScreen.main.bounds.size.width)
            }
        } else {
            if height > 0 {
                self.init(.init(height: height) * width / height)
            } else {
                self.init(width / 414 * UIScreen.main.bounds.size.width)
            }
        }
    }
    
    // MARK: - For Height Modifier
    init(height: (pad: CGFloat, phone: CGFloat), width: (pad: CGFloat, phone: CGFloat) = (0, 0)) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if width.pad > 0 {
                self.init(.init(width: width.pad) * height.pad / width.pad)
            } else {
                self.init(height.pad / 1366 * UIScreen.main.bounds.size.height)
            }
        } else {
            if width.phone > 0 {
                self.init(.init(width: width.phone) * height.phone / width.phone)
            } else {
                self.init(height.phone / 896 * UIScreen.main.bounds.size.height)
            }
        }
    }
    
    init(height: CGFloat, for width: CGFloat = 0) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if width > 0 {
                self.init(.init(width: width) * height / width)
            } else {
                self.init(height / 1366 * UIScreen.main.bounds.size.height)
            }
        } else {
            if width > 0 {
                self.init(.init(width: width) * height / width)
            } else {
                self.init(height / 896 * UIScreen.main.bounds.size.height)
            }
        }
    }
    
    func between(a: CGFloat, b: CGFloat) -> Bool {
        return self >= Swift.min(a, b) && self <= Swift.max(a, b)
    }
}
