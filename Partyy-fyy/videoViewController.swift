//
//  videoViewController.swift
//  Partyy-fyy
//
//  Created by OM KAMBLE on 12/04/23.
//

import UIKit
import AVFoundation
import AVKit

class videoViewController: UIViewController {
    
    @IBOutlet weak var viewPlay: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "closer", ofType: "mp4")!))
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true)
    }
    
    @IBAction func videoButton(_ sender: UIButton) {
       
        
    }
}




