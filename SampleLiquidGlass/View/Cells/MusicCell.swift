//
//  MusicCell.swift
//  SampleLiquidGlass
//
//  Created by Poem Kimlang on 10/18/25.
//

import UIKit

class MusicCell: UICollectionViewCell {
    @IBOutlet weak var coverImage       : UIImageView!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var titleLabel       : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(data: HomeModel.Content) {
        coverImage.layer.cornerRadius  = 13
        if let imageName = data.image, let image = UIImage(named: imageName) {
            coverImage.image = image
        } else {
            coverImage.image = nil
        }
        titleLabel.text         = data.title
        descriptionLabel.text   = data.subtitle
    }

}
