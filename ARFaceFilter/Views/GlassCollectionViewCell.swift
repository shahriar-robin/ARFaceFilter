import UIKit

class GlassCollectionViewCell: UICollectionViewCell {
    
    private let cornerRadius: CGFloat = 10
    static let cellID = "GlassCollectionViewCell"
    let glassFrame: UIImageView = UIImageView()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = .init(height: (27, 18))
        self.backgroundColor = .white
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(glassFrame)
        glassFrame.anchorView(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
    }
}
