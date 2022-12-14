//
//  ViewController.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 08.09.2022.
//

import UIKit
import Pulley

class ShazamController: UIViewController {
    
    //MARK: - Private properties
    
    private var shazamView: ShazamView? {
        guard isViewLoaded else { return nil }
        return view as? ShazamView
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shazamView?.setupSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        shazamView?.expandShazamButton()
        shazamView?.startTimer(with: self, selector: #selector(increaseTimer))
        setupPulleyViewController()
    }
    
    //MARK: - Settings
    
    private func setupPulleyViewController() {
        self.pulleyViewController?.displayMode = .automatic
        self.pulleyViewController?.drawerTopInset = view.frame.width * -0.12
    }
    
    //MARK: - Actions
    
    @objc private func increaseTimer() {
        shazamView?.time += 1
    }
}

