//
//  ViewController.swift
//  collectionView
//
//  Created by undhad kaushik on 19/01/23.
//

struct dryFruits{
    var image: UIImage
    var itemName: String
    var price: Double
    var gram: String
}


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dryFruitsCollectionView: UICollectionView!
    
    var arrDryFruits: [dryFruits] = []
    var arrImage: [String] = ["1", "2", "3", "4", "5", "6"]
    
    var interItemSpace: CGFloat = 16
    var cellInRow: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
    }
    private func setup(){
        loadNibRegister()
        loadItems()
    }
    
    private func loadNibRegister(){
        let nibFile: UINib = UINib(nibName: "DrayFruitsCollectionViewCell", bundle: nil)
        dryFruitsCollectionView.register(nibFile, forCellWithReuseIdentifier: "DrayFruitsCollectionViewCell")
        
    }
    
    private func loadItems(){
        
        let foodItem1: dryFruits = dryFruits(image: UIImage(named: "1")!, itemName: "Almonds", price: 200, gram: "100 gm")
        let foodItem2: dryFruits = dryFruits(image: UIImage(named: "2")!, itemName: "Walnuts", price: 150, gram: "250 gm")
        let foodItem3: dryFruits = dryFruits(image: UIImage(named: "3")!, itemName: "Apricot", price: 760, gram: "500 gm")
        let foodItem4: dryFruits = dryFruits(image: UIImage(named: "4")!, itemName: "Chestnut", price: 540, gram: "200 gm")
        let foodItem5: dryFruits = dryFruits(image: UIImage(named: "5")!, itemName: "Pine Nuts", price: 420, gram: "250 gm")
        let foodItem6: dryFruits = dryFruits(image: UIImage(named: "6")!, itemName: "Pistachio", price: 530, gram: "220 gm")
        
        arrDryFruits = [foodItem1,foodItem2,foodItem3,foodItem4,foodItem5,foodItem6]
        
    }
 
    
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDryFruits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: DrayFruitsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrayFruitsCollectionViewCell", for: indexPath)as! DrayFruitsCollectionViewCell
        
        var foodItem = arrDryFruits[indexPath.row]
        cell.nameLabel.text = "\(foodItem.itemName) "
        cell.weightLabel.text = "\(foodItem.gram)"
        cell.itemPriceLabel.text = "₹ \(foodItem.price)"
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 15
        cell.imageView.image = UIImage(named: arrImage[indexPath.row])
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.reloadData()
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let spacing = CGFloat(cellInRow+1)*interItemSpace
//           let width = collectionView.frame.width-spacing
//
//           let cellWidth = width/CGFloat(cellInRow)
//
//           return CGSize(width: cellWidth, height: 300)
         return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
