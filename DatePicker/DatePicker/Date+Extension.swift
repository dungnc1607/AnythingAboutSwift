//
//  Date+Extension.swift
//  DatePicker
//
//  Created by Squall on 10/11/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import UIKit

extension Date{
    static func calculateDate(day:Int, month: Int, year: Int, hour:Int, minute:Int) ->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let calculatedDate = formatter.date(from: "\(year)/\(month)/\(day)\(hour):\(minute)")
        return calculatedDate!
    }
    
    func getAllAboutDate() -> (day:Int, month: Int, year: Int, hour: Int, minute: Int, second: Int){
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let hour = calendar.component(.hour, from: self)
        let min = calendar.component(.minute, from: self)
        let sec = calendar.component(.second, from: self)
        // Self chính là Date()
        return (day, month, year, hour, min, sec)
    }
}
