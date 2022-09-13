//
//  LatestShazamCollectionViewCell.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

class LatestShazamCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "LatestShazamCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var appleLabel: UILabel!
    
    //MARK: - Settings
        
    private func setupSubView(with model: Shazam) {
        
        let contentViewWidth = self.frame.width
        
        appleLabel.layer.cornerRadius = contentViewWidth * 0.07
        appleLabel.layer.masksToBounds = true
        
        playButton.layer.cornerRadius = contentViewWidth * 0.2
        playButton.layer.masksToBounds = true
        playButton.alpha = 0.7
        
        titleLabel.font = .systemFont(ofSize: contentViewWidth * 0.1, weight: .semibold)
        subTitleLabel.font = .systemFont(ofSize: contentViewWidth * 0.08, weight: .light)
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        
        appleLabel.isHidden = false
    }
    
    private func setupContentView() {
        self.layer.cornerRadius = self.frame.width * 0.05
        self.layer.masksToBounds = true
    }
    
    func configure(with model: Shazam) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        songImage.image = UIImage(named: model.image ?? "")
        
        if model.title == "1 сентября" {
            appleLabel.isHidden = true
        } else {
            appleLabel.setLeftImage(withText: "Music",
                                    imageName: "applelogo",
                                    viewWidth: self.frame.width,
                                    imageSize: 0.075,
                                    positionY: -1,
                                    isRetreat: false)
        }
                
        setupSubView(with: model)
        setupContentView()
    }
}
