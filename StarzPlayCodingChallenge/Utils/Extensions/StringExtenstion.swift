//
//  StringExtenstion.swift
//  CodingChallenge
//
//  Created by Apple on 24/11/2023.
//

import Foundation
import UIKit
/* added to get the formatted year for subTitle at DetailView controller*/
extension String {
    func Date(withFormat format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        if let date = dateFormatter.date(from: self) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            return String(year)
        } else {
            return ""
        }
    }
}
