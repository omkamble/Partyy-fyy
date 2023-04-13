import UIKit
import AVFoundation

class videoViewController: UIViewController {

    @IBOutlet weak var viewPlay: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func videoButton(_ sender: UIButton) {
    
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "closer", ofType: "mp4")!))

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = viewPlay.bounds
        playerLayer.videoGravity = .resizeAspectFill
        viewPlay.layer.addSublayer(playerLayer)

        player.play()
    }
}
