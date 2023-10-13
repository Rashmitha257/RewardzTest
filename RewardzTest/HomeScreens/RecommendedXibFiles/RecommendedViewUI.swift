//
//  RecommendedViewUI.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class RecommendedViewUI: UIView {
    //MARK: - IBoutlets
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    
    //MARK: - Calss func
    class func instanceFromNib() -> RecommendedViewUI {
        return UINib(nibName: "RecommendedViewUI", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RecommendedViewUI
    }

}
