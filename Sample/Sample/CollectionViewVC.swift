
import UIKit
import Material

class CollectionViewVC: CollectionViewController {
    
    open override func prepare() {
        super.prepare()
        prepareDataSourceItems()
        prepareCollectionView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
}

extension CollectionViewVC {
    fileprivate func prepareDataSourceItems() {
        let data = ["meditation", "yoga", "surf"]
        
        data.forEach { [unowned self, w = view.bounds.width] (item) in
            let card = Card()
            let imageView = UIImageView()
            imageView.image = UIImage(named: item)?.resize(toWidth: w)
            imageView.contentMode = .scaleAspectFit
            card.contentView = imageView
            self.dataSourceItems.append(DataSourceItem(data: card, height: card.height))
        }
    }
    
    fileprivate func prepareCollectionView() {
        collectionView.interimSpacePreset = .interimSpace4
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")
    }
}

extension CollectionViewVC {
    @objc
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        let dataSourceItem = dataSourceItems[indexPath.item]
        let card = dataSourceItem.data as! Card
        cell.card = card
        return cell
    }
}
