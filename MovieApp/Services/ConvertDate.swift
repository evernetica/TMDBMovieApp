//
//  ConvertDate.swift
//  MovieApp
//
//  Created by Eugene Shapovalov on 01.03.2021.
//

import Foundation

class ConvertDate {
    static func convertDateFormat(inputDate: String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"
        
        let oldDate = olDateFormatter.date(from: inputDate) ?? Date()
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "d MMMM yyyy"
        
        return convertDateFormatter.string(from: oldDate)
    }
}
