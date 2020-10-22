//
//  ViewController.swift
//  Calculator2.0
//
//  Created by Filipp Krupnov on 10/16/20.
//

import UIKit

class ViewController: UIViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let calcView = CalcView()
        view.addSubview(calcView)
        let calcViewConstraints = [
            calcView.topAnchor.constraint(equalTo: view.topAnchor),
            calcView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calcView.leftAnchor.constraint(equalTo: view.leftAnchor),
            calcView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(calcViewConstraints)
        
    }


}
