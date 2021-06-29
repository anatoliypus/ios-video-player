//
//  VideoCell.swift
//  VideoPlayer
//
//  Created by Anatoliy Pushkarev on 29.06.2021.
//

import UIKit

class VideoCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private var videoImage: UIImageView!
    @IBOutlet private var videoTitle: UILabel!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Static properties
    static let identifier = "VideoCell"
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
    
    //MARK: - Public methods
    func setData(image: UIImage, title: String) {
        videoImage.image = image
        videoTitle.text = title
    }

}
