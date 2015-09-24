//
//  LoginViewController.swift
//  Facebook
//
//  Created by Matthew Sniff on 9/24/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginButton: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var formContainer: UIView!
   
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    var initialY: CGFloat!
    let offset: CGFloat = -70
    
    // view loaded
    override func viewDidLoad() {
        
        super.viewDidLoad()
        activityIndicator.hidden = true
        
        initialY = formContainer.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    // user tapped the view
    @IBAction func onTap(sender: AnyObject) {
        
        // will trigger keyboard to hide as well
        email.endEditing(true)
        password.endEditing(true)

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.formContainer.frame.origin = CGPoint(x: self.formContainer.frame.origin.x, y: self.initialY)
            
            }, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.formContainer.frame.origin = CGPoint(x: self.formContainer.frame.origin.x, y: self.initialY + self.offset)

            
            }, completion: nil)
    }
    
    // hit login button
    @IBAction func onLogin(sender: AnyObject) {
    
        loginButton.image =  UIImage(named: "logging_in_button")
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        // delay logincheck for 2 seconds
        delay(2.0) { () -> () in
            
            // must have an email
            if(self.email.text!.isEmpty) {
                
                let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                
            }
                // must have a password
            else if(self.password.text!.isEmpty) {
                
                let alertController = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                
            }
            
            // login information is correct
            if(self.email.text! == "msniff16@gmail.com" && self.password.text! == "password") {
                self.performSegueWithIdentifier("loginToTabCtr", sender: nil)
            }
            
        }
        
        
        
    }


}
