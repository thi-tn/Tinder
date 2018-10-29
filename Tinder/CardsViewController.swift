//
//  CardsViewController.swift
//  Tinder
//
//  Created by user144652 on 10/28/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var originalCenter: CGPoint!
    @IBOutlet weak var profilePicView: UIImageView!
   
    @IBAction func didPanImage(_ sender: Any) {
        let translation = (sender as AnyObject).translation(in: view)
        
        var velocity = (sender as AnyObject).velocity(in: view)
        
        
        if (sender as AnyObject).state == .began {
            originalCenter = profilePicView.center
        } else if (sender as AnyObject).state == .changed {
            profilePicView.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
            if translation.x > 0 {
                profilePicView.transform = CGAffineTransform(rotationAngle: CGFloat(15 * M_PI / 180))
                if velocity.x < 0 {
                    profilePicView.transform = CGAffineTransform.identity
                }
                
            } else {
                profilePicView.transform = CGAffineTransform(rotationAngle: CGFloat(-15 * M_PI / 180))
                if velocity.x > 0 {
                    profilePicView.transform = CGAffineTransform.identity
                }
            }
            
        } else if (sender as AnyObject).state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.profilePicView.center = CGPoint(x: self.originalCenter.x * 5, y: self.originalCenter.y)
                }, completion: nil)
            } else if translation.x < -50{
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.profilePicView.center = CGPoint(x: self.originalCenter.x * -5, y: self.originalCenter.y)
                }, completion: nil)
            } else {
                profilePicView.transform = CGAffineTransform.identity
                profilePicView.center = originalCenter
            }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileViewSegue" {
            let profilePic = self.profilePicView.image
            let profileViewNavController = segue.destination as! UINavigationController
            let profileViewController = profileViewNavController.topViewController as! ProfileViewController
            profileViewController.profilePic = profilePic
        }
        
    }
    
    @IBAction func cancelToCardsViewController(_ segue: UIStoryboardSegue) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
