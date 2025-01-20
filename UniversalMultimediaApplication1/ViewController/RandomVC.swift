//
//  RandomVC.swift
//  UniversalMultimediaApplication1
//
//  Created by Николай Гринько on 20.01.2025.
//

import UIKit

class RandomVC: UIViewController {

    let buttonLeft = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient(colors: [.customBlue, .customGreen],
                                   startPoint: CGPoint(x: 0.0, y: 0.0),
                                   endPoint: CGPoint(x: 1.0, y: 1.0))
        
        navigationController.map {$0 .navigationBar.isHidden = false}
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(didTapButton))
        //self.navigationItem.setHidesBackButton(false, animated: false)
        buttonLeft.setTitle("👈", for: .normal)
        view.addSubview(buttonLeft)
        buttonLeft.frame = CGRect(x: 10, y: 60, width: 60, height: 20)
        buttonLeft.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    
    }
    
    @objc private func didTapButton() {
        let vc = LoginRegistrationVC()
//        present(vc, animated: true)
        vc.modalPresentationStyle = .custom
        present(vc, animated: true)
    }
    
}
