//
//  PermissionVC.swift
//  DazzCamRemastered
//
//  Created by Appnap WS19 on 3/1/23.
//

//import UIKit
//import Photos
//
//class PermissionVC: UIViewController {
//    //MARK: - Data/Properties
//    let cameraPermissionButton = UIButton()
//    let micPermissionButton = UIButton()
//    let photosPermissionButton = UIButton()
//    let backButton = UIButton()
//    
//    //MARK: - Initializers
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initUI()
//        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized && AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) == .authorized && PHPhotoLibrary.authorizationStatus() == .authorized{
//            goMainController()
//        }
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        openWalkThrough()
//    }
//    
//    //MARK: - View Setup
//    private func initUI(){
//        
//        self.view.backgroundColor = UIColor.black
//        
//        let headingLabel = UILabel()
//        headingLabel.frame = CGRect(x: 100, y: 60 * SCALE_HEIGHT, width: SCREEN_WIDTH - 200, height: 30)
//        headingLabel.text = "Permission"
//        headingLabel.font = UIFont(name: Fonts.spaceGroteskBold, size: 24)
//        headingLabel.textAlignment = .center
//        headingLabel.textColor = .white
//        self.view.addSubview(headingLabel)
//        
//        
//        let attributedString = NSMutableAttributedString(string: "Dazz cam need your permission to function properly. You can change anytime from settings")
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 4 // Whatever line spacing you want in points
//        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
//        
//        let descriptionLabel = UILabel()
//        descriptionLabel.frame = CGRect(x: 30, y: headingLabel.frame.maxY + (20 * SCALE_HEIGHT), width: SCREEN_WIDTH - 60, height: 80)
//        descriptionLabel.attributedText = attributedString
//        descriptionLabel.font = UIFont(name: Fonts.azeretMonoLight, size: 15)
//        descriptionLabel.setLineSpacing(lineHeightMultiple: 1.37)
//        descriptionLabel.numberOfLines = 3
//        descriptionLabel.textAlignment = .center
//        descriptionLabel.textColor = UIColor.white.withAlphaComponent(0.8)
//        self.view.addSubview(descriptionLabel)
//        
//        
//        let headerImageView = UIImageView()
//        headerImageView.frame = CGRect(x: 40, y: descriptionLabel.frame.maxY + (30 * SCALE_HEIGHT), width: SCREEN_WIDTH - 80, height: 150 * SCALE_HEIGHT)
//        headerImageView.image = UIImage(named: "permissionHeaderIcon")
//        headerImageView.contentMode = .scaleAspectFit
//        self.view.addSubview(headerImageView)
//        
//        var upperPivot = headerImageView.frame.maxY + 50
//        
//        let photoIconIV = UIImageView()
//        photoIconIV.frame = CGRect(x: 20, y: upperPivot - 10, width: 40, height: 40)
//        photoIconIV.layer.cornerRadius = 20
//        photoIconIV.layer.masksToBounds = true
//        photoIconIV.image = UIImage(named: "permissionPhotoIcon")
//        photoIconIV.backgroundColor = .clear
//        self.view.addSubview(photoIconIV)
//        
//        photosPermissionButton.frame = CGRect(x: SCREEN_WIDTH - 90, y: upperPivot + 5, width: 70, height: 30)
//        
//        if PHPhotoLibrary.authorizationStatus() != .authorized{
//            photosPermissionButton.setTitle("Allow", for: .normal)
//        }else{
//            photosPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//        }
//        
//        photosPermissionButton.backgroundColor = .clear
//        photosPermissionButton.addTarget(self, action: #selector(photosPermissionAction), for: .touchUpInside)
//        photosPermissionButton.titleLabel?.font = UIFont(name: "AzeretMono-Regular", size: 15)
//        photosPermissionButton.layer.borderWidth = 1
//        photosPermissionButton.layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
//        photosPermissionButton.layer.masksToBounds = true
//        photosPermissionButton.layer.cornerRadius = 7
//        self.view.addSubview(photosPermissionButton)
//        
//        let photoLabel1 = UILabel()
//        photoLabel1.frame = CGRect(x: photoIconIV.frame.maxX + 15, y: upperPivot - 20, width: photosPermissionButton.frame.minX - photoIconIV.frame.maxX - 30, height: 20)
//        photoLabel1.text = "Photo Usage"
//        photoLabel1.font = UIFont(name: Fonts.spaceGroteskMedium, size: 18)
//        photoLabel1.textColor = .white
//        self.view.addSubview(photoLabel1)
//        
//        let photoLabel2 = UILabel()
//        photoLabel2.frame = CGRect(x: photoIconIV.frame.maxX + 15, y: photoLabel1.frame.maxY, width: photosPermissionButton.frame.minX - photoIconIV.frame.maxX - 30, height: 60 * SCALE_HEIGHT)
//        photoLabel2.text = "Permission to access the photo usage"
//        photoLabel2.numberOfLines = 2
//        photoLabel2.textAlignment = .left
//        photoLabel2.font = UIFont(name: Fonts.azeretMonoLight, size: 13)
//        photoLabel2.textColor = UIColor.white.withAlphaComponent(0.8)
//        self.view.addSubview(photoLabel2)
//        
//        upperPivot = photoLabel2.frame.maxY + 30
//        
//        let cameraIconIV = UIImageView()
//        cameraIconIV.frame = CGRect(x: 20, y: upperPivot - 10, width: 40, height: 40)
//        cameraIconIV.layer.cornerRadius = 20
//        cameraIconIV.layer.masksToBounds = true
//        cameraIconIV.image = UIImage(named: "permissionCameraIcon")
//        cameraIconIV.backgroundColor = .clear
//        self.view.addSubview(cameraIconIV)
//        
//        cameraPermissionButton.frame = CGRect(x: SCREEN_WIDTH - 90, y: upperPivot + 5, width: 70, height: 30)
//        if AVCaptureDevice.authorizationStatus(for: .video) !=  .authorized{
//            cameraPermissionButton.setTitle("Allow", for: .normal)
//        }else{
//            cameraPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//        }
//        //        cameraPermissionButton.setTitle("Allow", for: .normal)
//        cameraPermissionButton.backgroundColor = .clear
//        cameraPermissionButton.addTarget(self, action: #selector(cameraPermissionAction), for: .touchUpInside)
//        cameraPermissionButton.titleLabel?.font = UIFont(name: Fonts.azeretMonoRegular, size: 15)
//        cameraPermissionButton.layer.borderWidth = 1
//        cameraPermissionButton.layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
//        cameraPermissionButton.layer.masksToBounds = true
//        cameraPermissionButton.layer.cornerRadius = 7
//        self.view.addSubview(cameraPermissionButton)
//        
//        let cameraLabel1 = UILabel()
//        cameraLabel1.frame = CGRect(x: photoIconIV.frame.maxX + 15, y: upperPivot - 20, width: photosPermissionButton.frame.minX - photoIconIV.frame.maxX - 30, height: 20)
//        cameraLabel1.text = "Camera Usage"
//        cameraLabel1.font = UIFont(name: Fonts.spaceGroteskMedium, size: 18)
//        cameraLabel1.textColor = .white
//        self.view.addSubview(cameraLabel1)
//        
//        let cameraLabel2 = UILabel()
//        cameraLabel2.frame = CGRect(x: photoIconIV.frame.maxX + 15, y: cameraLabel1.frame.maxY, width: photosPermissionButton.frame.minX - photoIconIV.frame.maxX - 30, height: 60 * SCALE_HEIGHT)
//        cameraLabel2.text = "Permission to access the Camera usage"
//        cameraLabel2.numberOfLines = 2
//        cameraLabel2.textAlignment = .left
//        cameraLabel2.font = UIFont(name: Fonts.azeretMonoLight, size: 13)
//        cameraLabel2.textColor = UIColor.white.withAlphaComponent(0.8)
//        self.view.addSubview(cameraLabel2)
//        
//        upperPivot = cameraLabel2.frame.maxY + 30
//        
//        let micIconIV = UIImageView()
//        micIconIV.frame = CGRect(x: 20, y: upperPivot - 10, width: 40, height: 40)
//        micIconIV.layer.cornerRadius = 20
//        micIconIV.layer.masksToBounds = true
//        micIconIV.image = UIImage(named: "permissionMicIcon")
//        micIconIV.backgroundColor = .clear
//        self.view.addSubview(micIconIV)
//        
//        micPermissionButton.frame = CGRect(x: SCREEN_WIDTH - 90, y: upperPivot + 5, width: 70, height: 30)
//        if AVCaptureDevice.authorizationStatus(for: .audio) !=  .authorized{
//            micPermissionButton.setTitle("Allow", for: .normal)
//        }else{
//            micPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//        }
//        micPermissionButton.backgroundColor = .clear
//        micPermissionButton.addTarget(self, action: #selector(micPermissionAction), for: .touchUpInside)
//        micPermissionButton.titleLabel?.font = UIFont(name: Fonts.azeretMonoRegular, size: 15)
//        micPermissionButton.layer.borderWidth = 1
//        micPermissionButton.layer.borderColor = UIColor.gray.withAlphaComponent(0.7).cgColor
//        micPermissionButton.layer.masksToBounds = true
//        micPermissionButton.layer.cornerRadius = 7
//        self.view.addSubview(micPermissionButton)
//        
//        let micLabel1 = UILabel()
//        micLabel1.frame = CGRect(x: photoIconIV.frame.maxX + 15, y: upperPivot - 20, width: photosPermissionButton.frame.minX - photoIconIV.frame.maxX - 30, height: 20)
//        micLabel1.text = "Mic Usage"
//        micLabel1.font = UIFont(name: Fonts.spaceGroteskMedium, size: 18)
//        micLabel1.textColor = .white
//        self.view.addSubview(micLabel1)
//        
//        let micLabel2 = UILabel()
//        micLabel2.frame = CGRect(x: photoIconIV.frame.maxX + 15, y: micLabel1.frame.maxY, width: photosPermissionButton.frame.minX - photoIconIV.frame.maxX - 70, height: 60 * SCALE_HEIGHT)
//        micLabel2.text = "Permission to access the Mic usage"
//        micLabel2.numberOfLines = 2
//        micLabel2.textAlignment = .left
//        micLabel2.font = UIFont(name: Fonts.azeretMonoLight, size: 13)
//        micLabel2.textColor = UIColor.white.withAlphaComponent(0.8)
//        self.view.addSubview(micLabel2)
//        
//        let nextButton = GradientButton(colors: [UIColor(hexString: "59EB6D").cgColor, UIColor(hexString: "CFE949").cgColor])
//        nextButton.frame = CGRect(x: 40, y: micLabel2.frame.maxY + (40 * SCALE_HEIGHT), width: SCREEN_WIDTH - 80, height: 60 * SCALE_HEIGHT)
//        nextButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
//        nextButton.layer.masksToBounds = true
//        nextButton.layer.cornerRadius = 10
//        nextButton.setTitle("Finish", for: .normal)
//        nextButton.titleLabel?.font = UIFont(name: Fonts.azeretMonoSemiBold, size: 17)
//        nextButton.setTitleColor(UIColor(hexString: "262636"), for: .normal)
//        self.view.addSubview(nextButton)
//    }
//    
//    //MARK: - Helper Functions
//    private func openWalkThrough() {
//        guard !UserDefaults.standard.bool(forKey: HOME_WALK_THROUGH_KEY) else {return}
//        
//        //        if let userDefaults = UserDefaults(suiteName: APP_GROUP_ID) {
//        //            userDefaults.set(somePasteKeyboardText, forKey: KeyboardButtonTap.shared.textStorageKey)
//        //        }
//        
//        DispatchQueue.main.async {
//            let vc = WalkthroughVC()
//            vc.parentVC = self
//            //vc.delegate = self
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
//    
//    //MARK: - Selectors
//    @objc func continueAction(){
//        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized && AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) == .authorized && PHPhotoLibrary.authorizationStatus() == .authorized{
//            goMainController()
//        }else{
//            let alert = UIAlertController(title: "Permission Needed", message: "You need to allow all permission to use the app.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//                
//            }))
//            self.present(alert, animated: true, completion: nil)
//            
//        }
//    }
//    
//    @objc func cameraPermissionAction(){
//        print("camera")
//        if AVCaptureDevice.authorizationStatus(for: .video) !=  .authorized{
//            cameraPermissionButton.setImage(nil, for: .normal)
//            cameraPermissionButton.setTitle("Allow", for: .normal)
//            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
//                if response {
//                    //access granted
//                    print("granted")
//                    DispatchQueue.main.async {
//                        self.cameraPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//                        self.cameraPermissionButton.setTitle("", for: .normal)
//                    }
//                } else {
//                    print("denied")
//                    self.goToPermissionSetting()
//                }
//            }
//        }else{
//            cameraPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//            cameraPermissionButton.setTitle("", for: .normal)
//        }
//        
//    }
//    
//    @objc func micPermissionAction(){
//        print("mic")
//        let microPhoneStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
//        
//        if microPhoneStatus == .authorized{
//            micPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//            micPermissionButton.setTitle("", for: .normal)
//        }else{
//            micPermissionButton.setImage(nil, for: .normal)
//            micPermissionButton.setTitle("Allow", for: .normal)
//            AVCaptureDevice.requestAccess(for: AVMediaType.audio) { response in
//                if response {
//                    DispatchQueue.main.async {
//                        self.micPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//                        self.micPermissionButton.setTitle("", for: .normal)
//                    }
//                } else {
//                    self.goToPermissionSetting()
//                }
//            }
//        }
//        
//    }
//    
//    @objc func photosPermissionAction(){
//        let status = PHPhotoLibrary.authorizationStatus()
//        if status == .authorized{
//            photosPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//            photosPermissionButton.setTitle("", for: .normal)
//        }else{
//            photosPermissionButton.setImage(nil, for: .normal)
//            photosPermissionButton.setTitle("Allow", for: .normal)
//            PHPhotoLibrary.requestAuthorization { auth in
//                if auth == .authorized{
//                    DispatchQueue.main.async {
//                        self.photosPermissionButton.setImage(UIImage(named: "permissionTickIcon"), for: .normal)
//                        self.photosPermissionButton.setTitle("", for: .normal)
//                    }
//                }else{
//                    self.goToPermissionSetting()
//                }
//            }
//        }
//    }
//    
//    func goToPermissionSetting(){
//        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
//            return
//        }
//        if UIApplication.shared.canOpenURL(settingsUrl) {
//            DispatchQueue.main.async {
//                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                    print("Settings opened: \(success)")
//                })
//                
//            }
//        }
//    }
//    
//    func goMainController() {
//        let nextVC = HomeVC()
//        self.navigationController?.pushViewController(nextVC, animated: true)
//    }
//}
