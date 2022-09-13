//
//  ShazamView.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 08.09.2022.
//

import UIKit

class ShazamView: UIView {
    
    //MARK: - Global properties
    
    var time = 0 {
        didSet {
            if time % 2 == 0 {
                transitionPromptLabelText(with: "Долгое нажатие включает автошазам")
            } else {
                transitionPromptLabelText(with: "Шазамнуть")
            }
        }
    }
        
    //MARK: - Private properties
    
    private var timer: Timer?
    
    //MARK: - Views
    
    @IBOutlet weak var shazamButton: UIButton!
    @IBOutlet weak var promtpLabel: UILabel!
    
    //MARK: - Settings
    
    func setupSubView() {
        shazamButton.layer.cornerRadius = self.frame.width * 0.24
        shazamButton.layer.masksToBounds = true
        
        promtpLabel.setLeftImage(withText: "Шазамнуть",
                                 imageName: "mic.fill",
                                 viewWidth: self.frame.width,
                                 imageSize: 0.06,
                                 positionY: -3,
                                 isRetreat: true)
        promtpLabel.font = .systemFont(ofSize: self.frame.width * 0.06, weight: .heavy)
    }
    
    //MARK: - Animation
    
    func expandShazamButton() {
        UIView.animate(withDuration: 1) {
            self.shazamButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        } completion: { isDone in
            if isDone {
                self.squeezeShazamButton()
            }
        }
    }
    
    func startTimer(with target: UIViewController, selector: Selector) {
        timer = Timer.scheduledTimer(timeInterval: 4, target: target, selector: selector, userInfo: nil, repeats: true)
    }
    
    private func squeezeShazamButton() {
        UIView.animate(withDuration: 1) {
            self.shazamButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { isDone in
            self.expandShazamButton()
        }
    }
    
    private func transitionPromptLabelText(with text: String) {
        UIView.transition(with: promtpLabel, duration: 0.5, options: .transitionCrossDissolve) {
            self.promtpLabel.setLeftImage(withText: "Шазамнуть",
                                          imageName: "mic.fill",
                                          viewWidth: self.frame.width,
                                          imageSize: 0.06,
                                          positionY: -3,
                                          isRetreat: true)
        }
    }
}
