//
//  Service.swift
//  Todo
//
//  Created by Howard Thomas on 4/30/23.
//

import Foundation

enum CalanderErrors: Error {
    case noConvertMonth
    case noConvertDay
}

enum todoPriority: String, CaseIterable {
    case low = "low"
    case normal = "normal"
    case high = "high"
}

func getAttributedString(_ markdown: String) -> AttributedString {
    do {
        let attributedString = try AttributedString(markdown: markdown)
        return attributedString
    } catch {
        print("Couldn't parse: \(error)")
    }
    return AttributedString("Error parsing markdown")
}

let monthArr = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

func convertDateToMonthNumber(inputDate:Date)throws -> Int{
    
    let monthNumber = Calendar.current.dateComponents([.month], from: inputDate)
    
    if let number = monthNumber.month{
        return number
    }else{
        throw CalanderErrors.noConvertMonth
    }
}

func convertDateToDayNumber(inputDate:Date) throws -> Int {
    let dayNumber = Calendar.current.dateComponents([.day], from: inputDate)
    
    if let number = dayNumber.day{
        return number
    }else{
        throw CalanderErrors.noConvertDay
    }
}
