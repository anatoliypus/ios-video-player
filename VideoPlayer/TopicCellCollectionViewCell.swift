//
//  TopicCellCollectionViewCell.swift
//  VideoPlayer
//
//  Created by Anatoliy Pushkarev on 30.06.2021.
//

import UIKit

class TopicCellCollectionViewCell: UICollectionViewCell {

    //MARK: - Static properties
    
    static let identifier = "TopicCellCollectionViewCell"
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    //MARK: - Public methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

}
