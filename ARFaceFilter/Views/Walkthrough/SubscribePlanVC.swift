//
//  SubscribePlanVC.swift
//  DazzCamRemastered
//
//  Created by Appnap WS09 on 15/1/23.
//

//import UIKit
//import SafariServices
//
//protocol SubscribePlanVCDelegate: AnyObject {
//    func didSelectPlan(isPurchased: Bool)
//}
//
//class SubscribePlanVC: UIViewController {
//    //MARK: - Data Properties
//    
//    weak var delegate: SubscribePlanVCDelegate?
//    
//    let crossButton = UIButton().button(backgroundImage: UIImage(named: "roundedCross"), backgroundColor: .clear)
//    let titleLabel = UILabel().label(title: "Select your plan", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskMedium, size: 20), allignment: .center)
//    let yearlyView: UIView = {
//        let vw = UIView()
//        let titleLabel = UILabel().label(title: "Yearly Subscription", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.azeretMonoMedium, size: 17), allignment: .left)
//        let subTitleLabel = UILabel().label(title: "3 Days free trial", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskLight, size: 14), allignment: .left)
//        let yearlyPriceLabel = UILabel().label(title: "$49.99/", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskMedium, size: 18), allignment: .left)
//        let yearLabel = UILabel().label(title: "year", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskRegular, size: 14), allignment: .left)
//        
//        vw.addSubview(titleLabel)
//        titleLabel.anchorView(top: vw.topAnchor, left: vw.leftAnchor, paddingTop: 24 * SCALE_HEIGHT, paddingLeft: 24 * SCALE_HEIGHT)
//        
//        vw.addSubview(subTitleLabel)
//        subTitleLabel.anchorView(top: titleLabel.bottomAnchor, left: vw.leftAnchor, paddingTop: 9 * SCALE_HEIGHT, paddingLeft: 24 * SCALE_HEIGHT)
//        
//        vw.addSubview(yearlyPriceLabel)
//        yearlyPriceLabel.anchorView(left: vw.leftAnchor, bottom: vw.bottomAnchor, paddingLeft: 24 * SCALE_HEIGHT, paddingBottom: 24 * SCALE_HEIGHT)
//        
//        vw.addSubview(yearLabel)
//        yearLabel.anchorView(left: yearlyPriceLabel.rightAnchor, bottom: vw.bottomAnchor, paddingLeft: 5 * SCALE_HEIGHT, paddingBottom: 26 * SCALE_HEIGHT)
//        
//        vw.isUserInteractionEnabled = true
//        
//        return vw
//    }()
//    
//    let weeklyView: UIView = {
//        let vw = UIView()
//        let titleLabel = UILabel().label(title: "Weekly Subscription", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.azeretMonoMedium, size: 17), allignment: .left)
//        let subTitleLabel = UILabel().label(title: "Starts immediately", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskLight, size: 14), allignment: .left)
//        let weellyPriceLabel = UILabel().label(title: "$2.99/", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskMedium, size: 18), allignment: .left)
//        let weekLabel = UILabel().label(title: "week (no free trial)", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskRegular, size: 14), allignment: .left)
//        
//        vw.addSubview(titleLabel)
//        titleLabel.anchorView(top: vw.topAnchor, left: vw.leftAnchor, paddingTop: 24 * SCALE_HEIGHT, paddingLeft: 24 * SCALE_HEIGHT)
//        
//        vw.addSubview(subTitleLabel)
//        subTitleLabel.anchorView(top: titleLabel.bottomAnchor, left: vw.leftAnchor, paddingTop: 9 * SCALE_HEIGHT, paddingLeft: 24 * SCALE_HEIGHT)
//        
//        vw.addSubview(weellyPriceLabel)
//        weellyPriceLabel.anchorView(left: vw.leftAnchor, bottom: vw.bottomAnchor, paddingLeft: 24 * SCALE_HEIGHT, paddingBottom: 24 * SCALE_HEIGHT)
//        
//        vw.addSubview(weekLabel)
//        weekLabel.anchorView(left: weellyPriceLabel.rightAnchor, bottom: vw.bottomAnchor, paddingLeft: 5 * SCALE_HEIGHT, paddingBottom: 26 * SCALE_HEIGHT)
//        
//        vw.isUserInteractionEnabled = true
//        
//        return vw
//    }()
//    
//    let cancelLabel = UILabel().label(title: "Cancel Anytime", textColor: UIColor.white, lines: 1, fontStyle: UIFont(name: Fonts.spaceGroteskRegular, size: 14), allignment: .center)
//    
//    let continueButton = GradientButton(colors: [UIColor(hexString: "#3DEC55").cgColor, UIColor(hexString: "#CDF400").cgColor])
//    
//    let termsButton = UIButton().button(title: "Terms & conditions", titleColor: UIColor.white, backgroundColor: .clear, font: UIFont(name: Fonts.spaceGroteskRegular, size: 14)!, alpha: 1)
//    
//    let privacyButton = UIButton().button(title: "Privacy policy", titleColor: UIColor.white, backgroundColor: .clear, font: UIFont(name: Fonts.spaceGroteskRegular, size: 14)!, alpha: 1)
//    
//    let readLabel = UILabel().label(title: "", textColor: UIColor.white, lines: 0, fontStyle: UIFont(name: Fonts.spaceGroteskLight, size: 12), allignment: .center)
//    
//    let restoreButton = UIButton().button(title: "Restore Purchase", titleColor: UIColor.white, backgroundColor: .clear, font: UIFont(name: Fonts.spaceGroteskMedium, size: 14)!, alpha: 1)
//    
//    var subscripsionPlaneSelection: Int = 0{
//        didSet {
//            if subscripsionPlaneSelection == 0 {
//                yearlyView.backgroundColor = UIColor(hexString: "#161E14")
//                yearlyView.layer.borderColor = UIColor(hexString: "#59EB6D").cgColor
//                
//                weeklyView.backgroundColor = UIColor(hexString: "#000000")
//                weeklyView.layer.borderColor = UIColor(hexString: "#353542").cgColor
//            } else {
//                yearlyView.backgroundColor = UIColor(hexString: "#000000")
//                yearlyView.layer.borderColor = UIColor(hexString: "#353542").cgColor
//                
//                weeklyView.backgroundColor = UIColor(hexString: "#161E14")
//                weeklyView.layer.borderColor = UIColor(hexString: "#59EB6D").cgColor
//            }
//        }
//    }
//    
//    //MARK: - Initializers
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        view.backgroundColor = UIColor.black
//        viewSetup()
//    }
//    
//    //MARK: - Setup Layouts
//    private func viewSetup() {
//        view.addSubview(crossButton)
//        crossButton.anchorView(top: view.topAnchor, left: view.leftAnchor, paddingTop: 34 * SCALE_HEIGHT, paddingLeft: 32 * SCALE_HEIGHT, width: 24 * SCALE_HEIGHT, height: 24 * SCALE_HEIGHT)
//        
//        view.addSubview(titleLabel)
//        titleLabel.centerX(inView: view)
//        titleLabel.centerY(inView: crossButton)
//        
//        view.addSubview(yearlyView)
//        yearlyView.anchorView(top: titleLabel.bottomAnchor, paddingTop: 74 * SCALE_HEIGHT, width: 350 * SCALE_WIDTH, height: 130 * SCALE_HEIGHT)
//        yearlyView.centerX(inView: view)
//        yearlyView.backgroundColor = UIColor(hexString: "#161E14")
//        yearlyView.layer.cornerRadius = 16 * SCALE_HEIGHT
//        yearlyView.layer.borderWidth = 1
//        yearlyView.layer.borderColor = UIColor(hexString: "#59EB6D").cgColor
//        
//        view.addSubview(weeklyView)
//        weeklyView.anchorView(top: yearlyView.bottomAnchor, paddingTop: 20 * SCALE_HEIGHT, width: 350 * SCALE_WIDTH, height: 130 * SCALE_HEIGHT)
//        weeklyView.centerX(inView: view)
//        weeklyView.backgroundColor = UIColor(hexString: "#000000")
//        weeklyView.layer.cornerRadius = 16 * SCALE_HEIGHT
//        weeklyView.layer.borderWidth = 1
//        weeklyView.layer.borderColor = UIColor(hexString: "#353542").cgColor
//        
//        let weeklyViewPressed = UITapGestureRecognizer(target: self, action: #selector(weekViewTapped(_:)))
//        weeklyView.addGestureRecognizer(weeklyViewPressed)
//        
//        let yearlyViewPressed = UITapGestureRecognizer(target: self, action: #selector(yearViewTapped(_:)))
//        yearlyView.addGestureRecognizer(yearlyViewPressed)
//        
//        view.addSubview(cancelLabel)
//        cancelLabel.anchorView(top: weeklyView.bottomAnchor, paddingTop: 50 * SCALE_HEIGHT)
//        cancelLabel.centerX(inView: view)
//        
//        view.addSubview(continueButton)
//        continueButton.anchorView(top: cancelLabel.bottomAnchor, paddingTop: 28 * SCALE_HEIGHT, width: view.width * (366 / 414), height: view.height * (56 / 896))
//        continueButton.centerX(inView: view)
//        
//        continueButton.titleLabel?.font = UIFont(name: Fonts.azeretMonoSemiBold, size: 17)!
//        continueButton.setTitleColor(UIColor(hexString: "#262636"), for: .normal)
//        continueButton.setTitle("Continue", for: .normal)
//        
//        continueButton.clipsToBounds = true
//        continueButton.layer.cornerRadius = 16 * SCALE_HEIGHT
//        
//        view.addSubview(termsButton)
//        termsButton.anchorView(top: continueButton.bottomAnchor, left: view.leftAnchor, paddingTop: 26 * SCALE_HEIGHT, paddingLeft: 24 * SCALE_WIDTH, width: 130 * SCALE_HEIGHT, height: 30 * SCALE_HEIGHT)
//        
//        view.addSubview(privacyButton)
//        privacyButton.anchorView(top: continueButton.bottomAnchor, right: view.rightAnchor, paddingTop: 26 * SCALE_HEIGHT, paddingRight: 24 * SCALE_WIDTH, width: 95 * SCALE_HEIGHT, height: 30 * SCALE_HEIGHT)
//        
//        view.addSubview(readLabel)
//        readLabel.anchorView(top: privacyButton.bottomAnchor, paddingTop: 36 * SCALE_HEIGHT)
//        readLabel.centerX(inView: view)
//        readLabel.text = READ_ME
//        
//        view.addSubview(restoreButton)
//        restoreButton.anchorView(top: readLabel.bottomAnchor, paddingTop: 25 * SCALE_HEIGHT, width: 125 * SCALE_WIDTH, height: 25 * SCALE_HEIGHT)
//        restoreButton.centerX(inView: view)
//        
//        crossButton.addTarget(self, action: #selector(crossButtonPressed), for: .touchUpInside)
//        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
//        termsButton.addTarget(self, action: #selector(termsButtonPressed), for: .touchUpInside)
//        privacyButton.addTarget(self, action: #selector(privacyButtonPressed), for: .touchUpInside)
//        restoreButton.addTarget(self, action: #selector(restoreButtonPressed), for: .touchUpInside)
//    }
//    //MARK: - Helper Funtions
//    
//    //MARK: - Selectors
//    @objc func crossButtonPressed() {
//        self.dismiss(animated: true)
//    }
//    
//    @objc func weekViewTapped(_ recognizer: UIGestureRecognizer) {
//        subscripsionPlaneSelection = 1
//    }
//    
//    @objc func yearViewTapped(_ recognizer: UIGestureRecognizer) {
//        subscripsionPlaneSelection = 0
//    }
//    
//    @objc func continueButtonPressed() {
//        showCustomLoader()
//        IAPHandler.shared.purchaseSubscription(index: subscripsionPlaneSelection) { completed in
//            self.hideCustomLoader()
//            self.dismiss(animated: true)
//            self.delegate?.didSelectPlan(isPurchased: completed)
//        }
//    }
//    
//    @objc func termsButtonPressed() {
//        guard let url = URL(string: SettingsURLConstant.TERMS_URL) else { return }
//        present(SFSafariViewController(url: url), animated: true, completion: nil)
//    }
//    
//    @objc func privacyButtonPressed() {
//        guard let url = URL(string: SettingsURLConstant.PRIVACY_URL) else { return }
//        present(SFSafariViewController(url: url), animated: true, completion: nil)
//    }
//    
//    @objc func restoreButtonPressed() {
//        restorePurchase { completed in
//            self.dismiss(animated: true)
//            self.delegate?.didSelectPlan(isPurchased: completed)
//        }
//    }
//}
