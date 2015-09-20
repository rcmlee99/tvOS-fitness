

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    let segueID = "ShowAVPlayer"
    
    // MARK: - Interface
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var path = NSBundle.mainBundle().pathForResource("wallsit", ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)
        
        print("test")

    }
    
    override func viewDidAppear(animated: Bool) {
        let tapRecognizer = UITapGestureRecognizer(target: self, action:"tapped")
//        tapRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.PlayPause.rawValue)];
        self.view.addGestureRecognizer(tapRecognizer)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action:"swiped")
        swipeRecognizer.direction = .Right
        self.view.addGestureRecognizer(swipeRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tapped() {
        print("test")
    }
    
    func swiped() {
        print("test")
    }
    
    // MARK: - Navigation
    @IBAction func playVideo(sender: AnyObject) {
        self.performSegueWithIdentifier(segueID, sender: self)
    }
}
