//
//  SectionReusableView.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 12.09.2022.
//

import UIKit

class SectionReusableHeader: UICollectionReusableView {
    
    //MARK: - Identifier
    
    static let identifier = "SectionReusableHeader"
    
    //MARK: - Views
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var subSectionLabel: UILabel!
    
    //MARK: - Settings
    
    private func setupSubViews() {
        sectionLabel.font = .systemFont(ofSize: self.frame.width * 0.05, weight: .semibold)
        subSectionLabel.font = .systemFont(ofSize: self.frame.width * 0.035, weight: .light)
    }
    
    func configure(with model: ShazamSection) {
        
        switch model.type {
        case .list:
            sectionLabel.text = nil
            subSectionLabel.text = nil
            sectionImage.image = nil
        case .horizontalCard:
            sectionLabel.text = "Плейлист для тебя"
            subSectionLabel.text = "Рекомендации на основе твоих шазамов"
            sectionImage.image = UIImage(named: "header")
        case .verticalCard:
            sectionLabel.text = "Последние шазамы"
            subSectionLabel.text = nil
            sectionImage.image = nil
        }
        
        setupSubViews()
    }
}
