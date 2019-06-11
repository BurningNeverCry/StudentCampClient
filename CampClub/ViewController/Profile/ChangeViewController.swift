//
//  ChangeViewController.swift
//  MovelRater
//
//  Created by Luochun on 2019/4/22.
//  Copyright © 2019 Mantis group. All rights reserved.
//

import UIKit

class ChangeViewController: MTBaseViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarLeftButton(self)
        title = "User info"
        
        if let user :JSONMap = UserDefaults.standard.dictionary(forKey: kUserInfo) {
            if let v =  user["name"] as? String {
                nameField.text =  v
            }
            if let age = user["age"] as? Int {
                ageField.text = String(age)
            }
            if let v =  user["email"] as? String {
                emailField.text =  v
            }

        }
    }

    
    @IBAction func save() {
        guard let name = nameField.text, name.count > 0 else {return}
        MTHUD.showLoading()
        HttpApi.enchangeType(User.shared.userName!, user2Name: name) { (res, err) in
            MTHUD.hide()
            if let _ = res {
                showMessage( "转移成功")
                
            } else {
                showMessage(err)
            }
        }
    }
}
