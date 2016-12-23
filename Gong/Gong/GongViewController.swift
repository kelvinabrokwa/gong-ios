//
//  GongViewController.swift
//  Gong
//
//  Created by Kelvin Abrokwa on 12/22/16.
//  Copyright © 2016 Gong. All rights reserved.
//

import UIKit
import AVFoundation

class GongViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var gongImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func gongHit(_ sender: UITapGestureRecognizer) {
        gongImage.image = UIImage(named: "gongHit")
        soundGong()
    }
    
    // MARK: Private Methods
    
    func soundGong() {
        
    }
}

