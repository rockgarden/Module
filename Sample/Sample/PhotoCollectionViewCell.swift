
import UIKit
import Material

class PhotoCollectionViewCell: UICollectionViewCell {
    open var imageView: UIImageView!
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareImageView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareImageView()
    }
}

extension PhotoCollectionViewCell {
    fileprivate func prepareImageView() {
        imageView = UIImageView()
        imageView.clipsToBounds = true
        contentView.clipsToBounds = true
        contentView.layout(imageView).edges()
    }
}
