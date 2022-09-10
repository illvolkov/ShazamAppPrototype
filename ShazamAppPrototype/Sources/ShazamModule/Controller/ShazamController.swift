//
//  ViewController.swift
//  ShazamAppPrototype
//
//  Created by Ilya Volkov on 08.09.2022.
//

import UIKit

class ShazamController: UIViewController {
    
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
        shazamView?.expandShazamButton()
        shazamView?.startTimer(with: self, selector: #selector(increaseTimer))
    }
    
    //MARK: - Actions
    
    @objc private func increaseTimer() {
        shazamView?.time += 1
    }
}

