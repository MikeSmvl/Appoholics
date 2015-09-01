//
//  RegisterPageViewController.swift
//  PhoneBook
//
//  Created by David Hakopian on 2015-09-01.
//  Copyright © 2015 David Hakopian. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    //MARK: Input fields
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUser(sender: AnyObject) {
        let username = usernameTextField.text!
        let phoneNumber = phoneNumberTextField.text!
        let password = passwordTextField.text!
        let confirmPass = confirmPasswordTextField.text!
        
        validateFields(username, phoneNumber: phoneNumber, password: password, confirm: confirmPass)
    }
    
    func validateFields(username: String, phoneNumber: String, password: String, confirm: String){
        if(username.isEmpty || phoneNumber.isEmpty || password.isEmpty){
            displayAlertMessage("Please fill out all the fields")
            return
        }
        if(password != confirm){
            displayAlertMessage("Passwords do not match")
            return
        }
        storeUser(username, phoneNumber: phoneNumber, password: password)
    }
    
    func displayAlertMessage(message: String){
        var alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        var dismiss = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(dismiss)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func storeUser(username: String, phoneNumber: String, password: String){
        NSUserDefaults.standardUserDefaults().setValue(username, forKey: "username")
        NSUserDefaults.standardUserDefaults().setValue(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().setValue(phoneNumber, forKey: "phoneNumber")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        var alert = UIAlertController(title: "Succes", message: "Registered succesfully", preferredStyle: UIAlertControllerStyle.Alert)
        
        var dismiss = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alert.addAction(dismiss)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
