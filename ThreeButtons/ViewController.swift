//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Nikolay Pochekuev on 04.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstButton: AnimatedButton!
    @IBOutlet weak var secondButton: AnimatedButton!
    @IBOutlet weak var thirdButton: AnimatedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentSecondViewController(sender: UIButton) {
        let vc = SecondViewController()
        firstButton.backgroundColor = .systemGray2
        secondButton.backgroundColor = .systemGray2
        thirdButton.backgroundColor = .systemGray2
        firstButton.tintColor = .systemGray3
        secondButton.tintColor = .systemGray3
        thirdButton.tintColor = .systemGray3
        
        vc.isDidDismiss = { [weak self] in
            UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
                self?.firstButton.backgroundColor = .systemBlue
                self?.secondButton.backgroundColor = .systemBlue
                self?.thirdButton.backgroundColor = .systemBlue
                self?.firstButton.tintColor = .white
                self?.secondButton.tintColor = .white
                self?.thirdButton.tintColor = .white
            }
        }

        self.present(vc, animated: true)
    }

}

class AnimatedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTargets()
        setContentInsets()
        setButtonStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTargets()
        setContentInsets()
        setButtonStyle()
    }
    
    func setButtonStyle() {
        self.backgroundColor = .systemBlue
        self.tintColor = .white
        self.layer.cornerRadius = 8
    }

    func setContentInsets() {
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
    }

    func addTargets() {
        self.addTarget(self, action: #selector(scaleDownAnimated), for: .touchDown)
        self.addTarget(self, action: #selector(scaleBackToNormalAnimated), for: [.touchUpOutside, .touchCancel, .touchUpInside])
    }

    @objc func scaleDownAnimated() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }

    @objc func scaleBackToNormalAnimated() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
