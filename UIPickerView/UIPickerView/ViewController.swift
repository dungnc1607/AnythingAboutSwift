//
//  ViewController.swift
//  UIPickerView
//
//  Created by Squall on 10/9/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSelectedItem: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    var flowerName = ["Rose","Lily","Holly","Jasmine","Daisy","Alyssum","Violet","Ivy"]
    let rowHeight:CGFloat = 50.0

    override func viewDidLoad() {
        super.viewDidLoad()
       pickerView.selectRow(flowerName.count/2, inComponent: 0, animated: true )//Để lấy phần tử ở giữa của pickerView
        labelSelectedItem.text = flowerName[flowerName.count/2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flowerName.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flowerName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelSelectedItem.text = flowerName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label:UILabel?
        if view == nil {
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: pickerView.frame.height))
        }else{
            label = view as? UILabel
        }
        label?.text = flowerName[row]
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 18)
        label?.backgroundColor = . darkGray
        return label!
    }
}
