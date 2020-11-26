//
//  SecondVCViewController.swift
//  Worst-Calculator-In-The-World
//
//  Created by Nawras Janoudi on 11/2/20.
//

import UIKit

class SecondVCViewController: UIViewController {
    
    var result = ""
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Empty"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resultLabel)
        resultLabel.text = result
        
        resultLabelConfig()
        
    }
    
    func resultLabelConfig() {
        resultLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 0, enableInsets: true)
    }
    
}
