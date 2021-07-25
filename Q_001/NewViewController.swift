//
//  NewViewController.swift
//  Q_001
//
//  Created by 鄭淳澧 on 2021/7/25.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myAceImageView: UIImageView!
    @IBOutlet weak var myRedImageView: UIImageView!
    @IBOutlet weak var mySadImageView: UIImageView!
    
    var fullScreenSize = UIScreen.main.bounds.size
    var fullScreenOrigin = UIScreen.main.bounds.origin
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myAceImageView.contentMode = .scaleAspectFill
        mySlider.backgroundColor = .lightGray
        mySlider.maximumTrackTintColor = .orange
        mySlider.minimumTrackTintColor = .green
        mySlider.isContinuous = true
//        mySlider.addTarget(self, action: Selector(), for: .valueChanged)
        mySlider.value = 0
        mySadImageView.image = UIImage(named: "003")
        mySadImageView.alpha = 0
        mySadImageView.layer.borderWidth = 5
        mySadImageView.layer.borderColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        
        
        
        
        
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
//        let num:Int = Int(floor(30 * mySlider.value / mySlider.maximumValue))
//        myAceImageView.image = UIImage(named: "13993deeb49d4e179c076b810655d58cnyeVhhlqEb23iz6L-\(num)")
//        myOkImageView.alpha = CGFloat(mySlider.value/mySlider.maximumValue)
//        myOkImageView.transform = CGAffineTransform.identity.translatedBy(x: fullScreenSize.width * 0.5 * CGFloat(mySlider.value / mySlider.maximumValue), y: fullScreenSize.height * 0.5 * CGFloat(mySlider.value/mySlider.maximumValue))
        
       

        let offsetAce:CGFloat = (fullScreenSize.width / 2 - myAceImageView.bounds.maxX - myAceImageView.bounds.width / 2 + 50)  * CGFloat((mySlider.value / mySlider.maximumValue))
        let offsetRed:CGFloat = (fullScreenSize.width / 2 - myRedImageView.bounds.maxX - myRedImageView.bounds.width / 2 + 70)  * CGFloat((mySlider.value / mySlider.maximumValue))

        myAceImageView.transform = CGAffineTransform.identity.translatedBy(x: offsetAce, y: myAceImageView.bounds.minY)
        myRedImageView.transform = CGAffineTransform.identity.translatedBy(x: -offsetRed, y: myAceImageView.bounds.minY)

        if mySlider.value != mySlider.maximumValue {
            mySadImageView.alpha = 0
            myAceImageView.alpha = 1
            myRedImageView.alpha = 1
        } else {
            mySadImageView.alpha = 1
            myAceImageView.alpha = 0
            myRedImageView.alpha = 0
        }
        
        
        
    }
    
    

}
