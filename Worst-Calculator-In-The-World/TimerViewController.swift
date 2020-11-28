//
//  TimerViewController.swift
//  Worst-Calculator-In-The-World
//  This is only a practice run on Swift and on version control using Github. Don't expect anything special in this app. Beginners are welcome to look into they code for reference. Pros are welcome to comment or suggest helpful insights.
//  Created by Nawras Janoudi on 11/17/20.
//

import UIKit

class TimerViewController: UIViewController {
    
    // Timer training
    var timer = Timer()
    var counter = 0
    
    // Timer label
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time:"
        label.textAlignment = .center
        return label
    }()

    let timerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add subviews
        view.addSubview(timeLabel)
        view.addSubview(timerButton)
        
        // config subviews
        configSubviews()
        
        // MARK: Actions
        timerButton.addTarget(self, action: #selector(startTimerFunc), for: .touchUpInside)
        
        
    }
    
    // config subviews function (stackview)
    func configSubviews() {
        let sv: UIStackView = UIStackView(arrangedSubviews: [timeLabel,timerButton])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        
        view.addSubview(sv)
        sv.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 140, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50, enableInsets: true)
        
    }
    @objc func startTimerFunc() {
        counter = 10
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        timeLabel.text = "Time: \(counter)"

    }
    @objc func timerFunc() {
        counter -= 1
        timeLabel.text = "Time: \(counter)"

        if counter == -1 {
            timer.invalidate()
            timeLabel.text = "Time is over!"
        }
        
    }
}
