//
//  ViewController.swift
//  tvOS9-VideoPlayer
//
//  Created by 付 旦 on 9/19/15.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workOutCOuntLabel: UILabel!{
        didSet{
            workOutCOuntLabel.layer.cornerRadius = workOutCOuntLabel.frame.height / 2
            workOutCOuntLabel.clipsToBounds = true
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
         (segue.destinationViewController as? VideoPlayerViewController)?.parentController = self
    }
    

}
