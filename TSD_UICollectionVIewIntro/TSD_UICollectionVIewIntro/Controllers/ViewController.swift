//
//  ViewController.swift
//  TSD_UICollectionVIewIntro
//
//  Created by Anton Zyabkin on 22.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var itemMenuArray : [Menu] = {
        var blancMenu = Menu ()
        blancMenu.name = "Coca-Cola"
        blancMenu.imageName = "coka"
        
        var coffeeMenu = Menu ()
        coffeeMenu.name = "StarBucks"
        coffeeMenu.imageName = "starb"
        
        var twixMenu = Menu ()
        twixMenu.name = "Twix Inc."
        twixMenu.imageName = "twix"
        
        return [blancMenu, coffeeMenu, twixMenu]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                vc.menu = menu
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //колличество айтемов всекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    //как будет выглядеть ячейка, какие данные мы ей передадим
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let itemCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            
            itemCell.menu = itemMenuArray [indexPath.row]
            return itemCell
        }
        
        
        return UICollectionViewCell ()
    }
    
    //этот метод отследвиает какая ячейка была нажата и реализовывает то что написано внутри
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemMenuArray[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: menu) //вызывает сигвей для перехода на след вью контроллер и передает по нему sender:menu (далее идем в метод prepare
    }

}
