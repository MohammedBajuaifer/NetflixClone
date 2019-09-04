//
//  SignupController.swift
//  NetflixClone
//
//  Created by Moe on 04/09/2019.
//  Copyright © 2019 Mohammed salem bajuaifer. All rights reserved.
//

import UIKit
import Alamofire

class SignupController: UIViewController {
    
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "NETFLIX"
        label.textColor = UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1)
        label.textAlignment = .center
//        label.backgroundColor = .yellow
        label.constrainHeight(constant: 50)
        return label
    }()
    
    let emailTextFlied: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.cornerRadius = 8
        textField.placeholder = "Email Address"
        textField.backgroundColor = .white
        textField.constrainHeight(constant: 50)
        textField.tintColor = .black
        return textField
    }()
    
    let usernameTextFlied: CustomTextField = {
          let textField = CustomTextField()
          textField.layer.cornerRadius = 8
          textField.placeholder = "Username"
          textField.backgroundColor = .white
          textField.constrainHeight(constant: 50)
          textField.tintColor = .black
          return textField
      }()
    
    let passwordTextFlied: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 8
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.constrainHeight(constant: 50)
        textField.tintColor = .black
        return textField
    }()
    
    let signupButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = #colorLiteral(red: 0.3008527756, green: 0.3009090722, blue: 0.3008453846, alpha: 1)
        btn.setTitleColor(UIColor.init(red: 0.8980392157, green: 0.03921568627, blue: 0.07450980392, alpha: 1), for: .normal)
        btn.setTitle("Sign up", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.layer.cornerRadius = 8
        btn.constrainHeight(constant: 50)
//        btn.constrainWidth(constant: frame.width - 20)
        btn.addTarget(self, action: #selector(signupClicked), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.103221871, green: 0.10324689, blue: 0.1032185927, alpha: 1)
        signupButton.constrainWidth(constant: view.frame.width - 20)
        let verticalStackView = VerticalStackView(arrangedSubviews: [
            mainLabel,
            emailTextFlied,
            usernameTextFlied,
            passwordTextFlied,
            signupButton
        ], spacing: 16)
        
        verticalStackView.distribution = .fill
        view.addSubview(verticalStackView)
        
//        verticalStackView.constrainHeight(constant: 300)
//        verticalStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        verticalStackView.centerInSuperview()
    }
    
    @objc func signupClicked() {
        guard let email = emailTextFlied.text, !email.isEmpty,
            let password = passwordTextFlied.text, !password.isEmpty,
            let username = usernameTextFlied.text, !username.isEmpty else { return }
        
        let param = [
            "emailAddress": email,
            "fullName": username,
            "password": password
        ]
        
        let url = "http://localhost:1337/api/v1/entrance/signup"
        Alamofire.request(url, method: .post, parameters: param)
            .validate(statusCode: 200..<300)
            .responseData { (dataResp) in
                if let err = dataResp.error {
                    print(err)
                    return
                }
                self.dismiss(animated: true, completion: nil)
        }
    }
}
