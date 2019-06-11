//
//  ScheduleViewController.swift
//  CampClub
//
//  Created by Luochun on 2019/5/3.
//  Copyright © 2019 Mantis group. All rights reserved.
//

import UIKit

class ScheduleViewController: MTBaseViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var upButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.addTapGesture { (_) in
            MutilImageViewer.init([""], imageViews: [self.imgView]).show(at: 0)
        }
        
        if User.shared.role != .manager {
            upButton.isHidden = true
        }
    }

    @IBAction func upload(_ sender: UIButton) {
        
    }
    
}
