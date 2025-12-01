//
//  UIView+Extension.swift
//  CustomCamera
//
//  Created by AppnapWS11 on 19/3/23.
//

import UIKit
import Foundation

extension UIView {
    
    func addInnerBorder(width: Int){
        let borderLayer = CAShapeLayer()
        borderLayer.path = (self.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
        borderLayer.strokeColor = UIColor.red.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 5
        borderLayer.frame = self.bounds
        self.layer.addSublayer(borderLayer)
    }
    
    func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
        let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: angleInRadians)
        
        UIView.animate(withDuration: 0.2) {
            self.transform = rotation
        }
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    //    self.btn.applyGradient(colours: [.yellow, .blue])
    //    self.view.applyGradient(colours: [.yellow, .blue, .red], locations: [0.0, 0.5, 1.0])
}

//--Set_Constraint_Device--
class ConstraintFrame{
    static func top(topAnchor: CGFloat)->CGFloat{
        return (topAnchor/896)*CGFloat(SCREEN_HEIGHT)
    }
    static func trailing(trailingAnchor: CGFloat)->CGFloat{
        return (trailingAnchor/414)*CGFloat(SCREEN_WIDTH)
    }
    static func bottom(bottomAnchor: CGFloat)->CGFloat{
        return (bottomAnchor/896)*CGFloat(SCREEN_HEIGHT)
    }
    static func leading(leadingAnchor: CGFloat)->CGFloat{
        return (leadingAnchor/414)*CGFloat(SCREEN_WIDTH)
    }
    static func width(width: CGFloat)->CGFloat{
        return (width/414)*CGFloat(SCREEN_WIDTH)
    }
    static func height(height: CGFloat)->CGFloat{
        return (height/896)*CGFloat(SCREEN_HEIGHT)
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView{
    
    func centerX(withView view: UIView, multiplier: CGFloat, constant: CGFloat) {
        NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func centerY(withView view: UIView, multiplier: CGFloat, constant: CGFloat) {
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor , gradientLayer: CAGradientLayer) {
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x:1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        gradientLayer.needsDisplayOnBoundsChange = true
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorView(top: NSLayoutYAxisAnchor? = nil,
                    left: NSLayoutXAxisAnchor? = nil,
                    bottom: NSLayoutYAxisAnchor? = nil,
                    right: NSLayoutXAxisAnchor? = nil,
                    paddingTop: CGFloat = 0,
                    paddingLeft: CGFloat = 0,
                    paddingBottom: CGFloat = 0,
                    paddingRight: CGFloat = 0,
                    width: CGFloat? = nil,
                    height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let lefts = leftAnchor {
            anchorView(left: lefts, paddingLeft: paddingLeft)
        }
    }
    
    public var width: CGFloat{
        return frame.size.width
    }
    public var height: CGFloat{
        return frame.size.height
    }
    public var top: CGFloat{
        return frame.origin.y
    }
    public var bottom: CGFloat{
        return frame.origin.y + frame.size.height
    }
    public var left: CGFloat{
        return frame.origin.x
    }
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    func adShadowForIconList(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }
    
    enum ViewBorder: String {
        case left, right, top, bottom
    }
    
    func add(Border border: ViewBorder, withColor color: UIColor = UIColor.gray, andWidth width: CGFloat = 1.0, lineWithPaddingLeft: Bool = true) {
        
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(borderView)
        NSLayoutConstraint.activate(getConstrainsFor(forView: borderView, WithBorderType: border, andWidth: width, lineWithPaddingLeft: lineWithPaddingLeft))
        
    }
    
    func setBorder(borderWidth : CGFloat = 1 , borderColor : UIColor = .red){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    private func getConstrainsFor(forView borderView: UIView, WithBorderType border: ViewBorder, andWidth width: CGFloat, lineWithPaddingLeft: Bool=true) -> [NSLayoutConstraint] {
        
        let height = borderView.heightAnchor.constraint(equalToConstant: width)
        let widthAnchor = borderView.widthAnchor.constraint(equalToConstant: width)
        let leading = borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lineWithPaddingLeft == true ? UIScreen.main.bounds.width*0.048309:0)
        let trailing = borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let top = borderView.topAnchor.constraint(equalTo: self.topAnchor)
        let bottom = borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        switch border {
            
        case .bottom:
            return [bottom, leading, trailing, height]
            
        case .top:
            return [top, leading, trailing, height]
            
        case .left:
            return [top, bottom, leading, widthAnchor]
            
        case .right:
            return [top, bottom, trailing, widthAnchor]
        }
    }
    
    func view(backgroundColor: UIColor, alpha: CGFloat) ->UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.alpha = alpha
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIView {
    
    /**
     Rotate a view by specified degrees
     parameter angle: angle in degrees
     */
    
    func takeScreenshot() -> UIImage {
        let size = CGSize(width: .init(w: 414), height: .init(h: 354))
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(.init(w: 414), .init(h: 354)), false, UIScreen.main.scale)
        drawHierarchy(in: CGRect(x: .init(w: 0), y: .init(h: 0), width: size.width, height: size.height), afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = CGAffineTransformRotate(self.transform, radians);
        self.transform = rotation
    }
    
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [CACornerMask]
    }
    
}

//Shimmer
extension UIView {
    
    func startShimmering() {
        let light = UIColor.white.cgColor
        let alpha = UIColor.white.withAlphaComponent(0.6).cgColor
        let gradient = CAGradientLayer()
        gradient.colors = [alpha, light, alpha]
        gradient.frame = CGRect(x: -self.bounds.size.width, y: 0, width: 3 * self.bounds.size.width, height: self.bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.8)
        gradient.locations = [0.4, 0.5, 0.6]
        self.layer.mask = gradient
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 1.5
        animation.repeatCount = HUGE
        gradient.add(animation, forKey: "shimmer")
    }
    
    func stopShimmering(){
        self.layer.mask = nil
    }
    
}

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String,
                                                                       withClass name: T.Type,
                                                                       for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: name), for: indexPath) as? T else { fatalError(
            "Couldn't find UICollectionReusableView for \(String(describing: name)), make sure the view is registered with collection view")
        }
        return view
    }
    
    func register<T: UICollectionViewCell>(cell name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach{
            register($0.self, forCellWithReuseIdentifier: String(describing: $0))
            //   register(cell: $0)
        }
    }
    
    func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }
}

extension UIView {
    
    var statusBarAndNavBarHeight: CGFloat {
        return UIView.calculateStatusBarAndNavBarHeight()
    }
    
    static func calculateStatusBarAndNavBarHeight() -> CGFloat {
        // Determine default heights
        let defaultStatusBarHeight: CGFloat = UIScreen.main.bounds.height >= 812 ? 48 : 20
        let defaultNavBarHeight: CGFloat = 44 // Standard navigation bar height
        // Calculate status bar height
        let statusBarHeight: CGFloat = {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? defaultStatusBarHeight
            } else {
                return UIApplication.shared.statusBarFrame.height
            }
        }()
        // Attempt to get navigation bar height from the root navigation controller
        var navBarHeight: CGFloat = defaultNavBarHeight // Fallback value
        if let rootNav = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            navBarHeight = rootNav.navigationBar.frame.height
        }
        // Return total height
        return statusBarHeight + navBarHeight
    }
}

extension UIView {
    class var identifier: String {
        return String(describing: self)
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            nextResponder = responder.next
        }
        return nil
    }
}
