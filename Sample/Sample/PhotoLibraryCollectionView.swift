
import UIKit
import Material

class PhotoLibraryCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    func prepare() {
        register(PhotoLibraryCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "PhotoLibraryCollectionReusableView")
        register(PhotoLibraryCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoLibraryCollectionViewCell")
    }
}


