
import Foundation
import UIKit
import AVKit

class VideoPlayerViewController: AVPlayerViewController {
    
    
    var parentController : ViewController?
        // MARK: - Properties
    let overlay = UIView(frame: CGRectMake(100, 100, 285, 225))
//    let watermark = "Nasa-Watermark"
//    var url = "http://files.parsetfss.com/5f5f39a3-98d7-4067-b845-5eb0e5254eb4/tfss-9d4ad362-bdbd-4b0f-b64c-b7b175e3b56d-jumpingjacks.mp4"
    var url : NSURL?
    
    let pathArray = ["wallsit","pushup","jumpingjack_dolby"]
    var pathCount = 0 {
        didSet{
            let path = NSBundle.mainBundle().pathForResource(pathArray[pathCount], ofType: "mp4")
            url = NSURL(fileURLWithPath: path!)
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource(pathArray[pathCount], ofType: "mp4")
        url = NSURL(fileURLWithPath: path!)
        
        
        setVideoPlayer()
                NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick", userInfo: nil, repeats: true)
        self.showsPlaybackControls = false
        let tapRecognizer = UITapGestureRecognizer(target: self, action:"pressed")
//        tapRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.PlayPause.rawValue)];
        self.view.addGestureRecognizer(tapRecognizer)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action:"swiped")
        swipeRecognizer.direction = .Right
        self.view.addGestureRecognizer(swipeRecognizer)
    }
    var count = 0 {
        didSet{
            parentController?.workOutCOuntLabel.text = count.description
        }
    }
    func pressed() {
        count++
        print(count.description)
    }
    
    func swiped() {
        pathCount = (pathCount+1)%3

        setVideoPlayer()
        print("test")
    }
    
    var timerCount = 0 {
        didSet{
            parentController?.timerLabel.text = "\(timerCount/60):\(timerCount%60)"
        }
    }
    
    func tick() {
        timerCount++
    }
}


//MARK: - VideoPlayer -> VideoPlayerViewController Extension
typealias VideoPlayer = VideoPlayerViewController
extension VideoPlayer {
    
    /// set video player for view
    func setVideoPlayer() {
        // watermark overlay (logo tv by example..)
//        overlay.addSubview(UIImageView(image: UIImage(named: watermark)))
        contentOverlayView?.addSubview(overlay)
        
        // AVPlayer Instance with NSURL
        player = AVPlayer(URL: url!)
        
        // Just Play!
        player?.play()
        timerCount = 0

    }
}