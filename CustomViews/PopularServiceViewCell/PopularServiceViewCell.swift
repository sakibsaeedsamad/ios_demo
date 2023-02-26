//
//  PopularServiceViewCell.swift
//  TuttProj
//
//  Created by Era-MobileApp on 23/2/23.
//

import UIKit

class PopularServiceViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopularServiceViewCell.self)

    @IBOutlet weak var popularServiceImageView: UIImageView!
    
    
    @IBOutlet weak var popularServiceTitleLbl: UILabel!
    
    func setup(popularService : PopularService){
        
        popularServiceTitleLbl.text = popularService.name
    }

}
