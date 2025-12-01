//
//  UserDefault+Extension.swift
//  WalkiTalki-Redesign
//
//  Created by Appnap Mahfuj on 27/3/24.
//

import Foundation

struct AppData {
    /**
     ** Examples**
     `@Storage(key: "landing_page_needed", defaultValue: false)`
     ``static var`` `landingPageAppearance` : ``Bool``[DataType]
     */
    
//    @Storage(key: "user_full_dress_up", defaultValue: FullDressUp())
//    static var fullDressUp : FullDressUp
//    
//    @Storage(key: "TimerPayWallPresent", defaultValue: false)
//    static var TimerPayWallPresent : Bool
//    
//    @Storage(key: "isAppInstalled", defaultValue: false)
//    static var isAppInstalled : Bool
//    
//    @Storage(key: "skipPaywallOnFirstHome", defaultValue: true)
//    static var skipPaywallOnFirstHome : Bool
//    
//    @Storage(key: "appTerminated", defaultValue: false)
//    static var appTerminated : Bool

}

// MARK: - Property Wrapper For UserDefaults
@propertyWrapper
struct Storage<T: Codable> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            // Read value from UserDefaults
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }
            
            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            // Convert newValue to data
            let data = try? JSONEncoder().encode(newValue)
            
            // Set value to UserDefaults
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
