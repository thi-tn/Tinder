//
//  ProfileViewController.swift
//  Tinder
//
//  Created by user144652 on 10/28/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePicView: UIImageView!
    var profilePic: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicView.image = profilePic
        // Do any additional setup after loading the view.
        let image = UIImage(named: "nav_bar2")
        self.navigationItem.titleView = UIImageView(image: image)
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
