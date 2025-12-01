//
//  UIButton+Extension.swift
//  CustomCamera
//
//  Created by AppnapWS11 on 18/6/23.
//

import UIKit

extension UIButton {
    func addIcon(sz: CGSize, icon: UIImage) {
        if let prevImg = self.viewWithTag(999) {
            prevImg.removeFromSuperview()
        }
        let img = UIImageView()
        img.tag = 999
        img.frame = CGRect(x: (self.frame.width - sz.width)/2, y: (self.frame.height - sz.height)/2, width: sz.width, height: sz.height)
        img.contentMode = .scaleAspectFit
        img.image = icon
        self.addSubview(img)
    }
}

extension UIButton {
    
    func setTitleWithoutAnimation(_ title: String?, for controlState: UIControl.State) {
        UIView.performWithoutAnimation {
            self.setTitle(title, for: controlState)
            self.layoutIfNeeded()
        }
    }
    
    private func setSplitLabel(_ title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        
        return button
    }
    
    func setImageWithoutAnimation(_ image: UIImage?, for controlState: UIControl.State) {
        UIView.performWithoutAnimation {
            self.setImage(image, for: controlState)
            self.layoutIfNeeded()
        }
    }
    
    func newButton(title: String,
                   titleColor: UIColor,
                   tag: Int,
                   font: UIFont?,
                   alpha: CGFloat)->UIButton{
        let finalFont = font?.withSize(UIScreen.main.bounds.width>428 ? font!.pointSize*1.5 : font!.pointSize)
        let button = UIButton()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.alpha = alpha
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.contentHorizontalAlignment = .center
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = finalFont
        return button
    }
    
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 0
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    
    func animateButtonDown() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    
    func animateButtonUp() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func zoomIn(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform.identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform.identity
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    func button(title: String? = nil,
                titleColor: UIColor = .white,
                backgroundImage: UIImage? = nil,
                backgroundColor: UIColor = .white,
                titleEdgeInsetsLeft: CGFloat = 0,
                tag: Int = 0,
                font: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular),
                alpha: CGFloat = 1.0) -> UIButton{
        let finalFont = font.withSize(UIScreen.main.bounds.width>428 ? font.pointSize*1.5 : font.pointSize)
        let button = UIButton(type: .system)
        (title != nil ) ?  button.setTitle(title, for: .normal)  : button.setTitle(.none, for: .normal)
        (backgroundImage != nil ) ?  button.setImage(backgroundImage, for: .normal) : button.setImage(.none, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = finalFont
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: titleEdgeInsetsLeft, bottom: 0, right: 0)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.tag = tag
        button.alpha = alpha
        return button
    }
}

/// capsule button
class CapsuleButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    let height = bounds.height
    layer.cornerRadius = height/2
  }
}

class CapsuleView: UIView {
  override func layoutSubviews() {
    super.layoutSubviews()
    let height = bounds.height
    layer.cornerRadius = height/2
  }
}
