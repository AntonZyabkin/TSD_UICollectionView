//
//  DetailViewController.swift
//  TSD_UICollectionVIewIntro
//
//  Created by Anton Zyabkin on 22.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            guard let name = menu?.name else {return}
            nameLabel.text = name
        }
    }
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            guard let image = menu?.imageName else {return}
            imageView.image = UIImage (named: image)
        }
    }
    
    
    var menu: Menu?
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
