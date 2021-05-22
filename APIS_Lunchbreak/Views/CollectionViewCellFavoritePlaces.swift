//
//  CollectionViewCellFavoritePlaces.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 21/05/21.
//

import UIKit

class CollectionViewCellFavoritePlaces: UICollectionViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
           super.awakeFromNib()
        viewCell.backgroundColor = UIColor(red: 249/255, green: 46/255, blue: 23/255, alpha: 1)
        viewCell.layer.cornerRadius = 5
        lbName.textColor = .white
        lbCategory.textColor = .white
        lbLocation.textColor = .white
    }
}
