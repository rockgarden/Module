
import UIKit
import Material

class PhotoLibraryCollectionViewCell: CollectionViewCell {
    open override func prepare() {
        super.prepare()
        pulseColor = .red
        pulseAnimation = .backing
        contentsGravityPreset = .resizeAspectFill
    }
}
