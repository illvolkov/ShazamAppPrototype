//
//  RowCollectionViewCell.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

class RowCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "RowCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    //MARK: - Settings
    
    private func setupContentView() {
        self.layer.cornerRadius = self.frame.width * 0.03
        self.layer.masksToBounds = true
    }
    
    private func setupSubViews() {
        titleLabel.font = .systemFont(ofSize: self.frame.width * 0.05, weight: .semibold)
        amountLabel.font = .systemFont(ofSize: self.frame.width * 0.05, weight: .semibold)
    }
    
    func configure(with model: Shazam) {
        titleLabel.text = model.title
        amountLabel.text = model.subTitle
        
        setupContentView()
        setupSubViews()
    }
}
