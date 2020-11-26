//
//  ViewController.swift
//  Worst-Calculator-In-The-World
//
//  Created by Nawras Janoudi on 10/21/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Instansialize
    

    let timerButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Start Timer", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()
        
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "The Worst Calculator"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    let firstNumberField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "insert numbers only"
        tf.textAlignment = .center
        tf.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        tf.borderStyle = .roundedRect
        return tf
    }()
    let secondNumberField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "insert numbers only"
        tf.textAlignment = .center
        tf.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let sumButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("+", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()
    
    let subtractButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("-", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()
    
    let multiplyButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("*", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        // button.titleLabel?.font = UIFont(name: "system", size: 20)
        return button
    }()
    
    let devideButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("/", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()
    
    let sendButton: UIButton = {
       let button = UIButton()
        button.setTitle("Send Result >", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return button
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Results"
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    let bView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    // MARK: ViewDidLoad
    override func viewDidLayoutSubviews() {
        
        navigationController?.navigationBar.isHidden = true
        
        super.viewDidLayoutSubviews()
        view.addSubview(firstNumberField)
        view.addSubview(secondNumberField)
        view.addSubview(sumButton)
        view.addSubview(subtractButton)
        view.addSubview(multiplyButton)
        view.addSubview(devideButton)
        view.addSubview(resultLabel)
        view.addSubview(bView)
        
        layoutConfig()
        configureFields()
        configureButtons()
        buttonViewConfig()
        
        
        // MARK: Actions
        sumButton.addTarget(self, action: #selector(additionConfig), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(subtractConfig), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(multiplyConfig), for: .touchUpInside)
        devideButton.addTarget(self, action: #selector(devideConfig), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(sendResult), for: .touchUpInside)
        
        let savedResult = UserDefaults.standard.object(forKey: "lastResult")
        
        if let savedValue = savedResult as? String {
            resultLabel.text = "\(savedValue)"
        }
    }
    
    // MARK: Config
    func layoutConfig() {
        // header label constraints
        
        // first number field constraints
        firstNumberField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 40, enableInsets: true)
        // second number field constraints
        secondNumberField.anchor(top: firstNumberField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 100, enableInsets: true)
        
    }
    
    func buttonViewConfig () {
        bView.anchor(top: nil, left: nil, bottom: sumButton.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 100, height: 100, enableInsets: true)
    }
    
    // stackView for view components
    func configureFields() {
        let stackView = UIStackView (arrangedSubviews: [headerLabel, firstNumberField, secondNumberField, resultLabel, sendButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50, enableInsets: true)
        
    }
    
    // stackView for buttons
    func configureButtons() {
        let buttonSV:UIStackView = UIStackView(arrangedSubviews: [sumButton, subtractButton, multiplyButton, devideButton])
        buttonSV.axis = .horizontal
        buttonSV.spacing = 10
        buttonSV.distribution = .fillEqually
        
        view.addSubview(buttonSV)
        buttonSV.anchor(top: resultLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50, enableInsets: true)
    }
    // MARK: Functions
    
    // Error message for empty fields
    func emptyFieldsError(){
        let alert = UIAlertController(title: "Error", message: "No numbers found", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    // math operations
    @objc func additionConfig() {
        guard let num1 = Int(firstNumberField.text!) else { emptyFieldsError(); return }
        guard let num2 = Int(secondNumberField.text!) else { emptyFieldsError(); return }
        let sum = num1 + num2
        resultLabel.text = "\(sum)"
        saveResult()
    }
    @objc func subtractConfig() {
        guard let num1 = Int(firstNumberField.text!) else {emptyFieldsError(); return}
        guard let num2 = Int(secondNumberField.text!) else {emptyFieldsError(); return}
        let subtract = num1 - num2
        resultLabel.text = "\(subtract)"
        saveResult()
    }
    @objc func multiplyConfig() {
        guard let num1 = Int(firstNumberField.text!) else {emptyFieldsError(); return}
        guard let num2 = Int(secondNumberField.text!) else {emptyFieldsError(); return}
        let multiply = num1 * num2
        resultLabel.text = "\(multiply)"
        saveResult()
    }
    @objc func devideConfig() {
        guard let num1 = Int(firstNumberField.text!) else {emptyFieldsError(); return}
        guard let num2 = Int(secondNumberField.text!) else {emptyFieldsError(); return}
        let devide = num1 / num2
        resultLabel.text = "\(devide)"
        saveResult()
    }
    @objc func sendResult() {
        performSegue(withIdentifier: "sendResult", sender: nil)
    }
    func saveResult() {
        // var result = resultLabel.text!
        UserDefaults.standard.setValue(resultLabel.text, forKey: "lastResult")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendResult" {
            let destinationVC = segue.destination as! SecondVCViewController
            destinationVC.result = resultLabel.text!
        }
    }
}
