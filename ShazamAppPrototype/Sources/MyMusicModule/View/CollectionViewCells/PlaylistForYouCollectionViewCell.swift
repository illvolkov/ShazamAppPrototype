//
//  PlaylistForYouCollectionViewCell.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

class PlaylistForYouCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "PlaylistForYouCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var appleLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!
    
    //MARK: - Settings
    
    private func setupSubView() {
        
        let contentViewWidth = self.frame.width
        
        playButton.layer.cornerRadius = contentViewWidth * 0.075
        playButton.layer.masksToBounds = true
        playButton.alpha = 0.7
        
        appleLabel.layer.cornerRadius = contentViewWidth * 0.035
        appleLabel.layer.masksToBounds = true
        
        dividerView.alpha = 0.5
        
        titleLabel.font = .systemFont(ofSize: contentViewWidth * 0.05, weight: .semibold)
        subTitleLabel.font = .systemFont(ofSize: contentViewWidth * 0.04, weight: .light)
    }
    
    func configure(with model: Shazam) {
        songImage.image = UIImage(named: model.image ?? "")
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        appleLabel.setLeftImage(withText: "Music",
                                imageName: "applelogo",
                                viewWidth: self.frame.width,
                                imageSize: 0.035,
                                positionY: -1,
                                isRetreat: false)
        
        setupSubView()
    }
}
