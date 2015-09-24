//
//  SettingsViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIActionSheetDelegate, UIAlertViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSizeMake(320, settingsImageView.image!.size.height)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }

    // display alert view to log the user out
    @IBAction func logout(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "", message: "Are you sure you want to logout?", preferredStyle: .ActionSheet)

        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        alertController.addAction(cancelAction)
        
        // create an OK action
        let logout = UIAlertAction(title: "Logout", style: .Default) { (action) in
            self.performSegueWithIdentifier("backToLogin", sender: nil)
            
        }
        alertController.addAction(logout)
        
        presentViewController(alertController, animated: true, completion: nil)

        
    }


}
