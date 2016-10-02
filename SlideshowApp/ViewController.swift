//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Sumit Joshi on 9/30/16.
//  Copyright © 2016 soomet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var slideImg: UIImageView!
    
    
    let images = [
        "img1", "img2", "img3", "img4"
    ]
    
    var imageCount :Int = 0
    var timer :NSTimer?
    
    override func viewDidLoad() {
        print( images[ imageCount ])
        super.viewDidLoad()
        
        slideImg.contentMode = .ScaleAspectFit
        setImages( imageCount )
        // Do any additional setup after loading the view, typically from a nib.
        
        //Single tap
        let tapGesture:UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped(_:)))
        
        //Set the Delegate
        tapGesture.delegate = self;
        
        //Add in the view
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //Tap event
    func tapped( _sender: UITapGestureRecognizer){
        print(_sender)
        
        //ShowDetailViewControllerへ遷移するためにSegueを呼び出す
        performSegueWithIdentifier("result", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextBtn(_sender: AnyObject) {
        
        imageCount += 1
        
        if(imageCount >= images.count){
            imageCount = 0
            setImages(imageCount)
        }
        
        setImages(imageCount)
    }
    
    @IBAction func previousBtn(_sender: AnyObject) {
        imageCount += -1
        
        if (imageCount <= -1){
            imageCount = 3
            setImages(imageCount)
        }
        
        setImages(imageCount)
    }

    @IBAction func startBtn(sender: AnyObject) {
        if timer == nil{
            
            timer = NSTimer.scheduledTimerWithTimeInterval(
                2.0,
                target: self,
                selector: #selector(self.nextBtn(_:)),
                userInfo: nil,
                repeats: true
            )
            
            //make the button  untouchable
            previousBtn.enabled = false;
            nextBtn.enabled = false;
            //change the start to stop
            startBtn.setTitle("Stop", forState: UIControlState())
            topLabel.text = "Slideshow"
        }else{
            timer!.invalidate()
            timer = nil
            //make the button touchable
            previousBtn.enabled = true;
            nextBtn.enabled = true;
            //make Stop to Start
            startBtn.setTitle("Start", forState: UIControlState())
            topLabel.text = "PhotoView"
        }
        
    }

    
    func setImages(imageCount:Int){
        slideImg.image = UIImage(named: images[imageCount])
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }
    //Not allow the rotation
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    //Segue 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "result"){
            let detailShow: ResultViewController = (segue.destinationViewController as? ResultViewController)!
            detailShow.img = slideImg.image
            timer!.invalidate()
    }
    }
}

