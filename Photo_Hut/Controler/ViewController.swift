//
//  ViewController.swift
//  Photo_Hut
//
//  Created by Md. Saiful Islam on 27/2/20.
//  Copyright © 2020 Md. Saiful Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let storybord = UIStoryboard (name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storybord.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    } 


}

