//
//  WalkthroughVC.swift
//  DazzCamRemastered
//
//  Created by Appnap WS09 on 26/12/22.
//

//import UIKit
//import Gifu
//
//protocol WalkThroughDelegate: AnyObject {
//    func didTapContinue()
//}
//
//class WalkthroughVC: UIViewController {
//    //MARK: - Properties
//    weak var delegate: WalkThroughDelegate?
//    var parentVC: UIViewController = UIViewController()
//    
//    let backgroundView = UIImageView()
//    //Scroll View
//    lazy var mainScrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.backgroundColor = UIColor.clear
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.showsVerticalScrollIndicator = false
//        view.showsHorizontalScrollIndicator = false
//        view.isUserInteractionEnabled = true
//        view.alwaysBounceVertical = false
//        view.isPagingEnabled = true
//        view.delegate = self
//        view.bounces = true
//        return view
//    }()
//    var previewView = UIView()
//    var customPageControl: CustomPageControllView = CustomPageControllView()
//    let shadowView = UIImageView()
//    let titleLabel = UILabel().label(title: WALKTHROUGH_TITLE[0], textColor: UIColor(hexString: "#FFFFFF"), lines: 2, fontStyle: UIFont(name: Fonts.azeretMonoSemiBold, size: SCREEN_HEIGHT * (30 / 896)), allignment: .left)
//    let subtitleLabel = UILabel().label(title: WALKTHROUGH_SUBTITLE[0], textColor: UIColor.white.withAlphaComponent(0.5), lines: 0, fontStyle: UIFont(name: Fonts.azeretMonoLight, size: SCREEN_HEIGHT * (15 / 896)), allignment: .left)
//    let nextButton = GradientButton(colors: [UIColor(hexString: "59EB6D").cgColor, UIColor(hexString: "CFE949").cgColor])
//    
//    var tag: Int = 0 {
//        didSet {
//            if tag == 0 {
//                titleLabel.text = WALKTHROUGH_TITLE[0]
//                subtitleLabel.text = WALKTHROUGH_SUBTITLE[0]
//                nextButton.setTitle("Continue", for: .normal)
//                customPageControl.page1.backgroundColor = UIColor.white
//                customPageControl.page2.backgroundColor = UIColor.white.withAlphaComponent(0.18)
//                customPageControl.page3.backgroundColor = UIColor.white.withAlphaComponent(0.18)
//                UIView.animate(withDuration: 0.5) {
//                    self.view.layoutIfNeeded()
//                    self.mainScrollView.contentOffset.x = 0
//                }
//            } else if tag == 1 {
//                titleLabel.text = WALKTHROUGH_TITLE[1]
//                subtitleLabel.text = WALKTHROUGH_SUBTITLE[1]
//                nextButton.setTitle("Continue", for: .normal)
//                customPageControl.page1.backgroundColor = UIColor.white.withAlphaComponent(0.18)
//                customPageControl.page2.backgroundColor = UIColor.white
//                customPageControl.page3.backgroundColor = UIColor.white.withAlphaComponent(0.18)
//                UIView.animate(withDuration: 0.5) {
//                    self.view.layoutIfNeeded()
//                    self.mainScrollView.contentOffset.x = (414 * self.view.width) / 414
//                }
//                
//            } else if tag == 2 {
//                titleLabel.text = WALKTHROUGH_TITLE[2]
//                subtitleLabel.text = WALKTHROUGH_SUBTITLE[2]
//                nextButton.setTitle("Get Started", for: .normal)
//                customPageControl.page1.backgroundColor = UIColor.white.withAlphaComponent(0.18)
//                customPageControl.page2.backgroundColor = UIColor.white.withAlphaComponent(0.18)
//                customPageControl.page3.backgroundColor = UIColor.white
//                UIView.animate(withDuration: 0.5) {
//                    self.view.layoutIfNeeded()
//                    self.mainScrollView.contentOffset.x = (828 * self.view.width) / 414
//                }
//            } else if tag == 3 {
//                print("Continue........")
//                dismiss(animated: false) { [weak self] in
//                    self?.delegate?.didTapContinue()
//                    UserDefaults.standard.set(true, forKey: HOME_WALK_THROUGH_KEY)
//                }
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        view.backgroundColor = .black
//        viewsetup()
//    }
//    
//    //MARK: - Setup Layouts
//    private func viewsetup() {
//        view.addSubview(backgroundView)
//        backgroundView.anchorView(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
//        backgroundView.image = UIImage(named: "walkthroughBackground")
//        
//        view.addSubview(mainScrollView)
//        mainScrollView.anchorView(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 520 * SCALE_HEIGHT)
//        
//        previewView.frame = CGRect(x: 0, y: 0, width: 1242 * SCALE_WIDTH, height: 520 * SCALE_HEIGHT)
//        mainScrollView.addSubview(previewView)
//        
//        let gifView1 = GIFImageView()
//        gifView1.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: previewView.height)
//        previewView.addSubview(gifView1)
//        gifView1.contentMode = .scaleToFill
//        gifView1.animate(withGIFNamed: "walkThroughVideo2")
//        
//        let gifView2 = GIFImageView()
//        gifView2.frame = CGRect(x: SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: previewView.height)
//        previewView.addSubview(gifView2)
//        gifView2.contentMode = .scaleToFill
//        gifView2.animate(withGIFNamed: "walkThroughVideo1")
//        
//        let gifView3 = GIFImageView()
//        gifView3.frame = CGRect(x: SCREEN_WIDTH * 2, y: 0, width: SCREEN_WIDTH, height: previewView.height)
//        previewView.addSubview(gifView3)
//        gifView3.contentMode = .scaleToFill
//        gifView3.animate(withGIFNamed: "walkThroughVideo3")
//        
//        mainScrollView.contentSize = CGSize(width: 3 * Int(SCREEN_WIDTH), height: Int(previewView.height))
//        
//        view.addSubview(nextButton)
//        nextButton.anchorView(bottom: view.bottomAnchor, paddingBottom: 50 * SCALE_HEIGHT, width: view.width * (366 / 414), height: view.height * (56 / 896))
//        nextButton.centerX(inView: view)
//        
//        nextButton.titleLabel?.font = UIFont(name: Fonts.azeretMonoRegular, size: 17)!
//        nextButton.setTitleColor(UIColor(hexString: "#262636"), for: .normal)
//        nextButton.setTitle("Continue", for: .normal)
//        
//        nextButton.clipsToBounds = true
//        nextButton.layer.cornerRadius = 16 * SCALE_HEIGHT
//        
//        view.addSubview(shadowView)
//        shadowView.anchorView(left: view.leftAnchor, bottom: nextButton.topAnchor, right: view.rightAnchor, paddingBottom: 12 * SCALE_HEIGHT, height: 622 * SCALE_HEIGHT)
//        shadowView.image = UIImage(named: "walkthroughShadow")
//        
//        //MARK: - Page Controll Added
//        view.addSubview(customPageControl)
//        customPageControl.anchorView(top: mainScrollView.bottomAnchor, paddingTop: view.height * (27 / 896), width: 97 * SCALE_WIDTH, height: view.height * (10 / 896))
//        customPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        view.addSubview(subtitleLabel)
//        subtitleLabel.anchorView(left: view.leftAnchor ,bottom: nextButton.topAnchor, paddingLeft: 24 * SCALE_WIDTH, paddingBottom: 40 * SCALE_HEIGHT)
//        subtitleLabel.setLineSpacing(lineSpacing: 5)
//        subtitleLabel.textAlignment = .left
//        
//        view.addSubview(titleLabel)
//        titleLabel.anchorView(left: view.leftAnchor ,bottom: subtitleLabel.topAnchor, paddingLeft: 24 * SCALE_WIDTH, paddingBottom: 16 * SCALE_HEIGHT)
//        titleLabel.setLineSpacing(lineSpacing: 10)
//        titleLabel.textAlignment = .left
//        
//        //Add Target
//        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
//    }
//    
//    //MARK: - Helper Funtions
//    
//    //MARK: - Selectors
//    @objc func nextButtonPressed() {
//        tag += 1
//    }
//}
//
////MARK: - Extension
//extension WalkthroughVC: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if self.mainScrollView.contentOffset.x == 0 {
//            tag = 0
//        } else if self.mainScrollView.contentOffset.x == (414 * self.view.width) / 414 {
//            tag = 1
//        } else if self.mainScrollView.contentOffset.x == (828 * self.view.width) / 414 {
//            tag = 2
//        }
//    }
//}
