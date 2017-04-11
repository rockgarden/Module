
import UIKit
import Material

class PhotoCollectionViewController: UIViewController {
    fileprivate var collectionView: UICollectionView!
    
    fileprivate let photos = [
        "photo1",
        "photo2",
        "photo3",
        "photo4",
        "photo5",
        "photo6",
        "photo7",
        "photo8",
        "photo9",
        "photo10",
        "photo12",
        "photo13",
        "photo14",
        "photo15",
        "photo16",
        "photo17",
        "photo18",
        "photo19",
        "photo20",
        "photo21",
        "photo22",
        "photo23",
        "photo24",
        "photo25",
        "photo26",
        "photo27",
        "photo28",
        "photo29",
        "photo30",
        "photo31",
        "photo32"
    ]
    
    fileprivate var images = [UIImage]()
    
    fileprivate var fabButton: FABButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        view.backgroundColor = .white
        
        preparePhotos()
        prepareCollectionView()
        prepareFABButton()
        prepareNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

extension PhotoCollectionViewController {
    fileprivate func preparePhotos() {
        photos.forEach { [unowned self] in
            guard let image = UIImage(named: $0) else {
                return
            }
            self.images.append(image)
        }
    }
    
    fileprivate func prepareCollectionView() {
        let columns: CGFloat = .phone == Device.userInterfaceIdiom ? 4 : 11
        let w: CGFloat = (view.bounds.width - columns - 1) / columns
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: w, height: w)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        view.layout(collectionView).edges()
        collectionView.reloadData()
    }
    
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.photoCamera, tintColor: .white)
        fabButton.pulseColor = .white
        fabButton.backgroundColor = Color.blue.base
        fabButton.motionIdentifier = "options"
        view.layout(fabButton).width(64).height(64).bottom(24).right(24)
    }
    
    fileprivate func prepareNavigationBar() {
        navigationItem.title = "Olo Alaia"
        navigationItem.detail = "Surf & Brew"
    }
}

extension PhotoCollectionViewController {
    @objc
    func motion(motion: Motion, willTransition fromView: UIView, toView: UIView) {
        fabButton.imageView?.motion(.fade(0), .duration(0.03))
    }
    
    @objc
    func motion(motion: Motion, didTransition fromView: UIView, toView: UIView) {
        fabButton.imageView?.motion(.fade(1), .duration(0.03))
    }
    
    @objc
    func motionDelayTransitionByTimeInterval(motion: Motion) -> TimeInterval {
        return 0.03
    }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {
    @objc
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @objc
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    @objc
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        cell.imageView.contentMode = .scaleToFill
        cell.imageView.motionIdentifier = photos[indexPath.item]
        return cell
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegate {
    @objc
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoViewController(image: images[indexPath.item])
        vc.imageView.motionIdentifier = photos[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
