//
//  Date+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by Appnap WS12 on 11/3/24.
//

import Foundation

extension Date {
    
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self)
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    var time: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }
    
    var time_without_am_pm: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: self)
    }
    
    func changeDays(by days: Int) -> String{
        let date = Calendar.current.date(byAdding: .day, value: days, to: self)!
        return "\(date.year)-\(date.month)-\(date.day)"
    }
    
    static func getCurrentDate() -> String
    {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        return dateFormatter.string(from: Date())
        
    }
    
    
    static func getCurrentDateButton() -> String
    {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd"
        
        return dateFormatter.string(from: Date())
        
    }
    
    static func getCurrentMonthButton() -> String
    {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM"
        
        return dateFormatter.string(from: Date())
        
    }
    
    static func dateFromCustomString(customString: String) -> Date {
        let dateFotmatter = DateFormatter()
        dateFotmatter.dateFormat = "MM/dd/yyyy"
        return dateFotmatter.date(from: customString) ?? Date()
    }
    
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    func toLocalTimeString(outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    static let chatMessageDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }()
}


extension String {
    func convertToLocalTimeString() -> String? {
        guard !self.isEmpty else {
            return Date().toLocalTimeString(outputFormat: "h:mm a")
        }
        
        guard let date = self.toDate(inputFormat: "yyyy-MM-dd HH:mm:ss",
                                     timeZone: TimeZone(abbreviation: "UTC")) else {
            return Date().toLocalTimeString(outputFormat: "h:mm a")
        }
        
        return date.toLocalTimeString(outputFormat: "h:mm a")
    }
    
    private func toDate(inputFormat: String, timeZone: TimeZone? = TimeZone.current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = Locale.current
        
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func toCustomString() -> String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        // Check if the date is today
        if calendar.isDateInToday(self) {
            return "Today"
        }
        
        // Check if the date is yesterday
        if calendar.isDateInYesterday(self) {
            return "Yesterday"
        }
        
        // Format for specific date (e.g., "09 August")
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: self)
    }
}
