//
//  UILabel + Extension.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

extension UILabel {
    func setMicImage(with text: String, viewWidth: CGFloat) {
        let attachment = NSTextAttachment()
        
        let imageConfiguration = UIImage.SymbolConfiguration(weight: .heavy)
        let image = UIImage(systemName: "mic.fill")?.withTintColor(.white).withConfiguration(imageConfiguration)
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: -3, width: viewWidth * 0.055, height: viewWidth * 0.055)
        
        let attachmentStr = NSAttributedString(attachment: attachment)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)
        
        let textString = NSAttributedString(string: " " + text, attributes: [.font: font ?? ""])
        mutableAttributedString.append(textString)
        
        self.attributedText = mutableAttributedString
    }
}
