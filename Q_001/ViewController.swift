//
//  ViewController.swift
//  Q_001
//  Created by 鄭淳澧 on 2021/7/1.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var stringSizeSlider: UISlider!
    @IBOutlet weak var imageViewCornerRidiusSlider: UISlider!
    
    @IBOutlet weak var stringCountLabel: UILabel!
    @IBOutlet weak var stringSizeLabel: UILabel!
    @IBOutlet weak var classicalSlogan: UILabel!

    @IBOutlet weak var enterZone: UITextField!
    
    @IBOutlet weak var imageTag: UISegmentedControl!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    private var activeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterZone.delegate = self   // 為了鍵盤彈出時提高 View
        // 設置原始的經典頁面
        classicalSlogan.text = "教練我想打球"
        myImageView.image = UIImage(named: "005")
        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardShown),
                           name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardHidden),
                           name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//    //MARK:釋放鍵盤監聽通知
//     func releaseNotification(){
//      NotificationCenter.default.removeObserver(self)
//     }
    
    @IBAction func changeSlogan(_ sender: Any) {
        classicalSlogan.text = enterZone.text
        stringCountLabel.text = "\(enterZone.text!.count) 字"
    }
    
    @IBAction func changeStringSize(_ sender: Any) {
        let fontSize = Int(stringSizeSlider.value)
        stringSizeLabel.text = "\(fontSize)"
        let font = classicalSlogan.font!
        let newFont = font.withSize(CGFloat(fontSize))
        classicalSlogan.font = newFont
    }
    
    @IBAction func changeCoRa(_ sender: Any) {
        myImageView.layer.cornerRadius =
        myImageView.frame.height *
        CGFloat(imageViewCornerRidiusSlider.value / imageViewCornerRidiusSlider.maximumValue)
    }
    
    @IBAction func changeIndex(_ sender: Any) {
        switch imageTag.selectedSegmentIndex {
            case 0:
                myImageView.image = UIImage(named: "005")
                classicalSlogan.text = "教練我想打球"
            case 1:
                myImageView.image = UIImage(named: "008")
                classicalSlogan.text = "真相只有一個"
            case 2:
                myImageView.image = UIImage(named: "011")
                classicalSlogan.text = "來呀我幫你找"
            default: break
//                myImageView.image = UIImage(named: "005")
//                classicalSlogan.text = "教練我想打球"
        }
    }
    
    //    let something = NSTextAttachment()
    @objc func keyboardShown(notification: Notification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        //取得鍵盤尺寸
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        //鍵盤頂部 Y軸的位置
        let keyboardY = self.view.frame.height - keyboardSize.height
        //編輯框底部 Y軸的位置
        let editingTextFieldY = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
        //相減得知, 編輯框有無被鍵盤擋住, > 0 有擋住, < 0 沒擋住, 即擋住多少
        let targetY = editingTextFieldY - keyboardY
        
        //設置想要多移動的高度
        let offsetY: CGFloat = 20

        if self.view.frame.minY >= 0 {
            if targetY > 0 {
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.frame = CGRect(x: 0, y:  -targetY - offsetY, width: self.view.bounds.width, height: self.view.bounds.height)
                })
            } else {
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.frame = CGRect(x: 0, y: -60, width: self.view.bounds.width, height: self.view.bounds.height)
                })
            }
        }
    }
    
    @objc func keyboardHidden(notification: Notification) {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        })
    }
    
}

extension ViewController: UITextFieldDelegate {
    //編輯時, 儲存實體
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        return true
    }

}

