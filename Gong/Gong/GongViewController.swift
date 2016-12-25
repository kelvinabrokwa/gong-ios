//
//  GongViewController.swift
//  Gong
//
//  Created by Kelvin Abrokwa on 12/22/16.
//  Copyright © 2016 Gong. All rights reserved.
//

import UIKit
import AVFoundation
import os.log

class GongViewController: UIViewController {

    // MARK: Properties
    
    var friends = [User]()
    @IBOutlet weak var gongImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The GongViewController is not inside a navigation controller.")
        }
        //dismiss(animated: true, completion: nil)
    }

    @IBAction func gongHit(_ sender: UITapGestureRecognizer) {
        gongImage.image = UIImage(named: "gongHit")
        
        for friend in friends {
            //os_log("gonging user \(friend.userId)", log: OSLog.default, type: .debug)
            print(friend.userId)
        }
        
        soundGong()
    }
    
    // MARK: Private Methods
    
    func soundGong() {}
}

