//
//  SecondViewController.swift
//  ThreeButtons
//
//  Created by Nikolay Pochekuev on 05.04.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var isDidDismiss: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.presentationController?.delegate = self
    }
}

extension SecondViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        isDidDismiss?()
    }
}
