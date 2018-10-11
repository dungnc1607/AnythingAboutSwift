//
//  ViewController.swift
//  DatePicker
//
//  Created by Squall on 10/11/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = Date.calculateDate(day: 1, month: 1, year: 1950, hour: 0, minute: 0)
        datePicker.maximumDate = Date.calculateDate(day: 31, month: 1, year: 2018, hour: 0, minute: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func actionValueChanged(_ sender: UIDatePicker) {
        labelDate.text = "Day: \(sender.date.getAllAboutDate().day), month: \(sender.date.getAllAboutDate().month), year: \(sender.date.getAllAboutDate().year)"
        labelTime.text = "Hour: \(sender.date.getAllAboutDate().hour), Minute: \(sender.date.getAllAboutDate().minute), Second: \(sender.date.getAllAboutDate().second)"
        
    }
    
}

