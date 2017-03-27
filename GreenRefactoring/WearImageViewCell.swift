//
//  WearImageViewCell.swift
//  GreenRefactoring
//
//  Created by DaichiSaito on 2017/03/17.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import UIKit
import NCMB
import AlamofireImage
class WearImageViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setCell(with data: NCMBObject) {
        let strUrl = data.object(forKey: "imagePath") as? String
        let url = URL(string: strUrl!)!
        self.imageView.af_setImage(withURL: url)
    }
}
