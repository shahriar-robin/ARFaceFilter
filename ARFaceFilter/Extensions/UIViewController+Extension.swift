//
//  UIViewController+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by AppnapWS09 on 29/2/24.
//

import UIKit
//import Lottie

var SHOWING_TOAST: Bool = false

extension UIViewController {
    //MARK: - DISMISS KEYBOARD BY TAPING ANYWHERE IN THE SCREEN
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - showToast
//    func showToast(message : String, font: UIFont = UIFont(name: Fonts.soraRegular, size: 16)!, yPadding: CGFloat? = nil) {
//        let TAB_BAR = CustomTabBar()
//        
//        let textWidth = message.getWidth(with: font) ///get message total width
//        ///here `40` value assign as a padding of toast leading & trailing side
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - ((textWidth+40)/2), y: self.view.frame.size.height-(TAB_BAR.hight + 35 + 20), width: .init(width: textWidth+40), height: 46))
//        toastLabel.backgroundColor = UIColor.black
//        toastLabel.textColor = UIColor.white
//        toastLabel.font = font
//        toastLabel.textAlignment = .center
//        toastLabel.text = message
//        toastLabel.alpha = 1.0
//        toastLabel.layer.cornerRadius = toastLabel.height/2;
//        toastLabel.adjustsFontSizeToFitWidth = true
//        toastLabel.clipsToBounds  =  true
//        self.view.addSubview(toastLabel)
//        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
//            toastLabel.alpha = 0.0
//        }, completion: {(isCompleted) in
//            toastLabel.removeFromSuperview()
//        })
//        
//        // Dynamic Y axis padding
//        if let yPadding = yPadding {
//            toastLabel.frame.origin.y = yPadding
//        }
//        
//    }
//    
//    func showLoader()
//    {
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            let animationView = LottieAnimationView.init(name: "Loader")
//            let blackView = UIView()
//            blackView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            animationView.frame = CGRect(x: 0, y: 0, width: .init(h: 110), height: .init(h: 110))
//            
//            blackView.backgroundColor = .black.withAlphaComponent(0.6)
//            blackView.center = view.center
//            
//            animationView.contentMode = .scaleAspectFit
//            animationView.loopMode = .loop
//            animationView.animationSpeed = 1
//            animationView.center = view.center
//            animationView.backgroundColor = .white
//            animationView.layer.cornerRadius = .init(h: 22)
//            animationView.clipsToBounds = true
//            view.isUserInteractionEnabled = false
//            animationView.tag = 9999
//            blackView.tag = 999
//            for subView in view.subviews{
//                if subView.tag == 9999{
//                    print("Already Added")
//                    return
//                }
//            }
//            self.view.addSubview(blackView)
//            self.view.addSubview(animationView)
//            animationView.play()
//            
//        }
//    }
//    
//    func hideLoader()
//    {
//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            let animationView = view.viewWithTag(9999) as? LottieAnimationView
//            let blackView = view.viewWithTag(999)
//            animationView?.stop()
//            animationView?.removeFromSuperview()
//            blackView?.removeFromSuperview()
//            view.isUserInteractionEnabled = true
//        }
//    }
    
    //Default alert
    func showAlert(twoButton: Bool = false, withTitle title: String, withMessage message:String, actionButtonTitle: String = "OK", completion: @escaping(_ okPressed: Bool)->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: actionButtonTitle, style: .default, handler: { action in
            completion(true)
        })
        alert.addAction(ok)
        if twoButton {
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                completion(false)
            })
            alert.addAction(cancel)
        }
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    func dismiss(){
        if let _ = self.navigationController , !self.isBeingPresented {
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: true)
        }
        
    }
    
    func pushOrPresentVC(vc: UIViewController) {
        if let nav = self.navigationController {
            nav.pushViewController(vc, animated: true)
        }else{
            self.present(vc, animated: true)
        }
    }
    
    func openAppSettings() {
        if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(appSettingsURL) {
                UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
            }
        }
    }
}

//MARK: - navRoot
extension UIViewController {
    var navRoot: UINavigationController {
        let vc = UINavigationController(rootViewController: self)
        vc.isNavigationBarHidden = true
        vc.isModalInPresentation = isModalInPresentation
        vc.modalTransitionStyle = modalTransitionStyle
        vc.modalPresentationStyle = modalPresentationStyle
        return vc
    }
}
