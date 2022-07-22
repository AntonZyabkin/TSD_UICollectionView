//
//  MenuCollectionViewCell.swift
//  TSD_UICollectionVIewIntro
//
//  Created by Anton Zyabkin on 22.07.2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var menu : Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let image = menu?.imageName {
                imageView.image = UIImage (named: image)
            }
        }
    }
    
    
}
