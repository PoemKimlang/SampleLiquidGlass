//
//  SectionCell.swift
//  SampleLiquidGlass
//
//  Created by Poem Kimlang on 10/18/25.
//

import UIKit

class SectionCell: UICollectionViewCell {
    @IBOutlet weak var arrowImage       : UIImageView!
    @IBOutlet weak var titleLabel       : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data: HomeModel.Content) {
        titleLabel.text = data.title
    }

}
