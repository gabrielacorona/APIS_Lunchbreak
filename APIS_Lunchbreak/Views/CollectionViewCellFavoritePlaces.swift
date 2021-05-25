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
        //viewCell.backgroundColor = UIColor(red: 249/255, green: 46/255, blue: 23/255, alpha: 1)
        viewCell.layer.cornerRadius = 20
        viewCell.layer.borderWidth = 0.5
        viewCell.layer.borderColor = CGColor(red: 178/255, green: 190/255, blue: 195/255, alpha: 1)
        lbName.textColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 0.9)
    }
}
