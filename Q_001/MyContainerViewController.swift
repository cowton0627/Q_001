//
//  MyContainerViewController.swift
//  Q_001
//
//  Created by 鄭淳澧 on 2021/7/25.
//

import UIKit

class MyContainerViewController: UIViewController {
    @IBOutlet weak var mybackgroundView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mybackgroundView.alpha = 0.4
    }

}
