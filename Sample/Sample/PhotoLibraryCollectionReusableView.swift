
import UIKit
import Material

class PhotoLibraryCollectionReusableView: CollectionReusableView {
    /// A reference to the toolbar.
    private(set) var toolbar: Toolbar!
    
    open override func prepare() {
        super.prepare()
        prepareToolbar()
    }
    
    /// Prepares the toolbar.
    private func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.titleLabel.font = RobotoFont.regular(with: 14)
        toolbar.titleLabel.textAlignment = .left
        toolbar.contentEdgeInsets.left = 16
        toolbar.contentEdgeInsets.right = 16
        toolbar.depthPreset = .none
        toolbar.dividerColor = Color.grey.lighten3
        layout(toolbar).edges()
    }
}
