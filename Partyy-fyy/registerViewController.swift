//
//  registerViewController.swift
//  Partyy-fyy
//
//  Created by OM KAMBLE on 12/04/23.
//

import UIKit
import FirebaseAuth
class registerViewController: UIViewController {

    @IBOutlet weak var passwordF: UITextField!
    @IBOutlet weak var emailiD: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        if let email = emailiD.text, let password = passwordF.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }else{
                    self.performSegue(withIdentifier: "registerPass", sender: self)
                }
            }
        }
    }
}
