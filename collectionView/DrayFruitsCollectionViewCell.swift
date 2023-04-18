//
//  DrayFruitsCollectionViewCell.swift
//  collectionView
//
//  Created by undhad kaushik on 19/01/23.
//

import UIKit

class DrayFruitsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
