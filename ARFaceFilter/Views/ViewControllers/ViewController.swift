//
//  ViewController.swift
//  ARFaceFilter
//
//  Created by Shahriar Robin on 21/9/25.
//

import UIKit
import ARKit

private let planeWidth: CGFloat = 0.13
private let planHeight: CGFloat = 0.06
private let nodeYPosition: Float = 0.022
private let minPositionDistance: Float = 0.0025
private let minScaling: CGFloat = 0.025
private let cellIdentifier = "GlassesCollectionViewCell"
private let glassesCount = 4
private let animationDuration: TimeInterval = 0.25
private let cornerRadius: CGFloat = 10

class ViewController: UIViewController {
    //MARK: - Properties
    var faceView = ARSCNView()
    var statusLabel: UILabel = UILabel()
    var assets = ["bunny1", "cat1", "glasses0", "glasses1", "glasses2", "glasses3", "bunny1"]
    
    private lazy var glassesPlane: SCNPlane = {
        SCNPlane(width: planeWidth, height: planHeight)
    }()
    private let glassNode = SCNNode()
    
    private var scaling: CGFloat = 1
    
    let cameraButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        faceView.delegate = self
        guard ARFaceTrackingConfiguration.isSupported else {
            statusLabel.text = "ARFaceTrackingConfiguration is not supported"
            return
        }
        // Do any additional setup after loading the view.
        viewSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARFaceTrackingConfiguration()
        faceView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        faceView.session.pause()
    }

    //MARK: - View Setup
    private func viewSetup() {
        view.addSubview(faceView)
        faceView.translatesAutoresizingMaskIntoConstraints = false
        
        faceView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        faceView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        faceView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        faceView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        faceView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel.centerXAnchor.constraint(equalTo: faceView.centerXAnchor).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: faceView.centerYAnchor).isActive = true
        
        filterCollectionSetup()
    }
    
    lazy var glassCollections: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = .init(height: (0, 0))
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGreen
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isSpringLoaded = true
        collectionView.bounces = true
        collectionView.isScrollEnabled = true
        return collectionView
    }()

    private func filterCollectionSetup() {
        cameraButton.setImage(UIImage(named: "cameraButton"), for: .normal)
        view.addSubview(cameraButton)
        cameraButton.anchorView(bottom: view.bottomAnchor, paddingBottom: 30 * SCALE_HEIGHT, width: 75 * SCALE_HEIGHT, height: 75 * SCALE_HEIGHT)
        cameraButton.centerX(inView: view)
        
        cameraButton.addTarget(self, action: #selector(homeCameraOptionsTapped), for: .touchUpInside)
        
        glassCollections.register(GlassCollectionViewCell.self, forCellWithReuseIdentifier: GlassCollectionViewCell.cellID)
        
        view.addSubview(glassCollections)
        glassCollections.anchorView(left: view.leftAnchor, bottom: cameraButton.topAnchor, right: view.rightAnchor, paddingTop: 30, height: 100 * SCALE_HEIGHT)
        
        glassCollections.delegate = self
        glassCollections.dataSource = self
    }
    
    private func updateGlasses(with index: Int) {
        let imageName = "glasses\(index)"
        glassesPlane.firstMaterial?.diffuse.contents = UIImage(named: imageName)
    }
    
    @objc func homeCameraOptionsTapped() {
        let vc = PreviewVC()
//        self.present(vc, animated: true)
//        
//        let vc = InboxViewController(viewModel: InboxDefaultViewModel(inboxInfo: info))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = faceView.device else {
            return nil
        }
        
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let faceNode = SCNNode(geometry: faceGeometry)
        faceNode.geometry?.firstMaterial?.transparency = 0
        glassesPlane.firstMaterial?.isDoubleSided = true
        updateGlasses(with: 0)
        
        glassNode.position.z = faceNode.boundingBox.max.z * 3 / 4
        glassNode.position.y = nodeYPosition
        glassNode.geometry = glassesPlane
        
        faceNode.addChildNode(glassNode)
        
       
        return faceNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
            return
        }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlassCollectionViewCell.cellID, for: indexPath) as! GlassCollectionViewCell
        let imageName = "glasses\(indexPath.row)"
        cell.glassFrame.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateGlasses(with: indexPath.row)
        
        print("\(indexPath.row)")
    }
}



