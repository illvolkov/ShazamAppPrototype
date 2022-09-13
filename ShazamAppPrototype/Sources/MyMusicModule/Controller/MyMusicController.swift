//
//  MyMusicController.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 11.09.2022.
//

import UIKit

class MyMusicController: UIViewController {
        
    var myMusicView: MyMusicView? {
        guard isViewLoaded else { return nil }
        return view as? MyMusicView
    }
    
    var model: Shazams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = Shazams()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myMusicView?.setupNavigationBar(with: navigationController)
    }
    
    private func configureView() {
        guard let model = model?.getShazams() else { return }
        myMusicView?.configureView(with: model)
        myMusicView?.setupSubViews()
    }
}
