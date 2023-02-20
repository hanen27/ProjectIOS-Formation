//
//  DateHelper.swift
//  ExerciceMeteo
//
//  Created by Hanen Abdelkrim on 14/11/2022.
//

import Foundation

class DateHelper {
    static let shared = DateHelper()
    let formatter = DateFormatter()
    func convertToTime(_ int: Int) -> String{
        let date = Date(timeIntervalSince1970: Double(int))
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let string = formatter.string(from: date)
        return string
    }
}
