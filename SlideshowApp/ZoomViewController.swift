//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 田村尚利 on 2018/11/03.
//  Copyright © 2018 masatoshi.tamura. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    var image0 :UIImage!
    
 @IBOutlet weak var zoomimage: UIImageView!
   
 //画面遷移後の画像読み込み
   override func viewDidLoad() {
        super.viewDidLoad()
    
    zoomimage.image = image0
    
    // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
