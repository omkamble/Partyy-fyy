import UIKit
import AVFoundation
import AVKit

class videoViewController: UIViewController {

    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var playerViewController: AVPlayerViewController?

    @IBOutlet weak var viewPlay: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func videoButton(_ sender: UIButton) {
        let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "closer", ofType: "mp4")!)
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = viewPlay.bounds
        playerLayer?.videoGravity = .resizeAspectFill
        viewPlay.layer.addSublayer(playerLayer!)

        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
        playerViewController?.view.frame = viewPlay.bounds
        addChild(playerViewController!)
        viewPlay.addSubview(playerViewController!.view)

        player?.play()
    }

    @IBAction func playPauseButtonPressed(_ sender: UIButton) {
        if player?.rate == 0 {
            player?.play()
        } else {
            player?.pause()
        }
    }

    @IBAction func rewindButtonPressed(_ sender: UIButton) {
        player?.seek(to: CMTime.zero)
    }

    @IBAction func fastForwardButtonPressed(_ sender: UIButton) {
        guard let duration = player?.currentItem?.duration else { return }
        let currentTime = CMTimeGetSeconds(player?.currentTime() ?? CMTime.zero)
        let newTime = currentTime + 10.0
        if newTime < CMTimeGetSeconds(duration) {
            let time = CMTimeMakeWithSeconds(newTime, preferredTimescale: 1)
            player?.seek(to: time)
        }
    }
}
