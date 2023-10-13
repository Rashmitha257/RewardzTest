//
//  OtherCombos.swift
//  RewardzTest
//
//  Created by Softsuave on 12/10/2023.
//

import UIKit

class OtherCombos: UIView {
    //MARK: - IBoutlets
    @IBOutlet weak var otherCombosCollectionView: UICollectionView!
    
    //MARK: - Calss func
    class func instanceFromNib() -> OtherCombos {
        return UINib(nibName: "OtherCombos", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! OtherCombos
    }

}
