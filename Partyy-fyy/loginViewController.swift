//
//  loginViewController.swift
//  Partyy-fyy
//
//  Created by OM KAMBLE on 12/04/23.
//

import UIKit
import FirebaseAuth
class loginViewController: UIViewController {
    @IBOutlet weak var emailID: UITextField!
    
    @IBOutlet weak var passwordf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        if let email = emailID.text, let password = passwordf.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error{
                    print(e)
                }else{
                    self.performSegue(withIdentifier: "loginPass", sender: self)
                }
            }
        }
    }
    
   
}
