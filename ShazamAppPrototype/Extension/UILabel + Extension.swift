//
//  UILabel + Extension.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

extension UILabel {
    func setLeftImage(withText text: String, imageName: String, viewWidth: CGFloat, imageSize: CGFloat, positionY: CGFloat, isRetreat: Bool) {
        let attachment = NSTextAttachment()
        
        let imageConfiguration = UIImage.SymbolConfiguration(weight: .heavy)
        let image = UIImage(systemName: imageName)?.withTintColor(.white).withConfiguration(imageConfiguration)
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: positionY, width: viewWidth * imageSize, height: viewWidth * imageSize)
        
        let attachmentStr = NSAttributedString(attachment: attachment)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)
        
        let textString = NSAttributedString(string: isRetreat ? " " + text : text,
                                            attributes: [.font: font ?? ""])
        mutableAttributedString.append(textString)
        
        self.attributedText = mutableAttributedString
    }
}
