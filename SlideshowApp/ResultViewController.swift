//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Sumit Joshi on 9/30/16.
//  Copyright © 2016 soomet. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var fullscreen: UIImageView!
    @IBOutlet weak var back: UIButton!
    
    var img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
        if img != nil{
            fullscreen.image = img
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
