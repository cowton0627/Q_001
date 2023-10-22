//
//  BackgroundViewController.swift
//  Q_001
//
//  Created by 鄭淳澧 on 2021/7/26.
//

import UIKit
import SwiftUI

class BackgroundViewController: UIViewController {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let headImage = UIImage(named: "maskKin2")
//        let treeImage = UIImage(named: "f_25421351_1")
//        headImageView = UIImageView(image: headImage)
//        treeImageView = UIImageView(image: treeImage)

       
        headImageView.image = UIImage(named: "maskKin2")
        treeImageView.image = UIImage(named: "f_25421351_1")
        treeImageView.mask = headImageView
        treeImageView.alpha = 0.4

    }

}

//struct BackgroundViewControllerView: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> ViewController {
//         UIStoryboard(name: "sub", bundle: nil).instantiateViewController(identifier: "BackgroundViewController") as! ViewController
//    }
//
//    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
//    }
//
//    typealias UIViewControllerType = ViewController
//}
//
//struct BackgroundViewControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            BackgroundViewControllerView()
//                .previewDevice("iPhone 12 mini")
//        }
//    }
//}
