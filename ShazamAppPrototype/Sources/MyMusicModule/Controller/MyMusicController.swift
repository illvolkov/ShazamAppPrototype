//
//  MyMusicController.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit
import Pulley

class MyMusicController: UIViewController {
    
    //MARK: - Private properties
            
    private var myMusicView: MyMusicView? {
        guard isViewLoaded else { return nil }
        return view as? MyMusicView
    }
        
    private var model: Shazams?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = Shazams()
        configureView()
        self.pulleyViewController?.delegate = self
    }
    
    //MARK: - Settings
    
    private func configureView() {
        guard let model = model?.getShazams() else { return }
        myMusicView?.configureView(with: model)
        myMusicView?.setupSubViews()
    }
}

//MARK: - PulleyDrawerViewControllerDelegate methods

extension MyMusicController: PulleyDrawerViewControllerDelegate {
    
    func drawerPositionDidChange(drawer: PulleyViewController, bottomSafeArea: CGFloat) {
        if drawer.drawerPosition == .partiallyRevealed {
            drawer.setDrawerPosition(position: .open, animated: true)
        }
    }
}
