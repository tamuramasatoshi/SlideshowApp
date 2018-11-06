//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田村尚利 on 2018/10/29.
//  Copyright © 2018 masatoshi.tamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nextbu: UIButton!
    @IBOutlet weak var back: UIButton!
    
       
    var timer : Timer!
    var image0 : UIImage!
    var zoomimage :UIImage!
    var  imageNumber = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageview.image = UIImage(named:"IMG_1165.JPG")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //画像をタップした時に画面遷移
    @IBAction func ontapimage(_ sender: Any) {
        
    self.timer.invalidate()
    self.timer = nil
        
    performSegue(withIdentifier: "result", sender: nil)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        let zoomimagecontroller : ZoomViewController = segue.destination as! ZoomViewController
        
        zoomimagecontroller.image0 = imageview.image
        
        image0 = imageview.image
        
    }

    //遷移先画面に戻る
    
    @IBAction func unwind( _ segue: UIStoryboardSegue) {
    
    
            imageview.image = image0
        
    }
    
    //進むのボタンを押した時
    @IBAction func nextbu(_ sender: Any) {
        
        
        if imageNumber == 0 {
            imageNumber = imageNumber + 1
            imageview.image = UIImage(named:"IMG_1168.JPG")
            
            
        } else if imageNumber == 1 {
            imageNumber = imageNumber + 1
            imageview.image = UIImage(named:"IMG_1172.JPG")
          
            
        } else if imageNumber == 2 {
            imageNumber = 0
            imageview.image = UIImage(named:"IMG_1165.JPG")
         
        }
        
    }
    
    //戻るのボタンを押した時
    @IBAction func back(_ sender: Any) {
        
        
        if imageNumber == 0 {
            imageNumber = 2
            imageview.image = UIImage(named:"IMG_1172.JPG")
            
            
        } else if imageNumber == 2 {
            imageNumber = 1
            imageview.image = UIImage(named:"IMG_1168.JPG")
           
            
        } else if imageNumber == 1 {
            imageNumber = 0
            imageview.image = UIImage(named:"IMG_1165.JPG")
          
        }
        
    }
    //スライドショーで行う内容
    @objc func updateTimer(_ timer: Timer) {
        
        if imageNumber == 0 {
            imageview.image = UIImage(named:"IMG_1168.JPG")
            imageNumber = imageNumber + 1
            
        } else if imageNumber == 1 {
            imageview.image = UIImage(named:"IMG_1172.JPG")
            imageNumber = imageNumber + 1
            
        } else if imageNumber == 2 {
            imageview.image = UIImage(named:"IMG_1165.JPG")
            imageNumber = 0
        }
    }
    //再生・一時停止のボタンを押した時
    @IBAction func timerstart(_ sender: Any) {
        
        if self.timer == nil {
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0 , target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            nextbu.isEnabled = false
            back.isEnabled = false
            
        }
        else if self.timer !== nil {
            
            self.timer.invalidate()
            self.timer = nil
            nextbu.isEnabled = true
            back.isEnabled = true
            
        }
        
    }
}

