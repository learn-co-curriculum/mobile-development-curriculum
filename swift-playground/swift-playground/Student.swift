//  Student.swift

import Foundation

class Student {
    let username: String
    var firstName: String?
    var lastName: String?
    var email: String?
    var phone: String?
    
    init(username: String, firstName: String?, lastName: String?) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
    }
    
    convenience init(username: String) {
        self.init(username: username, firstName: nil, lastName: nil)
    }
}

class Circle {
    var diameter: Double = 1
    var circumference: Double { return diameter * M_PI }
    
    init(diameter: Double) {
        self.diameter = diameter
    }
}

