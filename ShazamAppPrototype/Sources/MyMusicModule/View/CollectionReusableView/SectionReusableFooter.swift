//
//  SectionSeusableFooter.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 13.09.2022.
//

import UIKit

class SectionReusableFooter: UICollectionReusableView {
    
    //MARK: - Identifier
    
    static let identifier = "SectionReusableFooter"
    
    //MARK: - Views
    
    @IBOutlet weak var moreButton: UIButton!
    
    //MARK: - Settings
    
    private func setupSubViews() {
        moreButton.layer.cornerRadius = self.frame.width * 0.05
        moreButton.layer.masksToBounds = true
    }
    
    func configure(with model: ShazamSection) {
        if model.type == .list {
            moreButton.isHidden = true
        } else {
            moreButton.isHidden = false
        }
        
        setupSubViews()

    }
}
