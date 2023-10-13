//
//  ImageDetailsCollectionViewCell.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class ImageDetailsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    static let IDENTIFIER = "ImageDetailsCollectionViewCell"
    
    //MARK: - Class func
    class func ImageDetailsCollectionViewCell() -> ImageDetailsCollectionViewCell {
        return UINib(nibName: IDENTIFIER, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ImageDetailsCollectionViewCell
    }
    
    //MARK: - other func
    /// Settiong collection cell Initial view
    /// - Parameters:
    ///   - menu: food data
    ///   - isRecommened: isRecommened screen or not
    func setCellvalues(menu: MenuData, isRecommened: Bool) {
        dishLabel.text = menu.foodname
        costLabel.text = menu.foodCost
        dishImageView.layer.cornerRadius = dishImageView.frame.height / 2
        dishImageView.layer.masksToBounds = true
        dishImageView.image = UIImage(named: menu.foodImage)
        if !isRecommened {
            self.contentView.backgroundColor = .yellow.withAlphaComponent(0.1)
        }
    }
}
