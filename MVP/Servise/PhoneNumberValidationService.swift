//
//  PhoneNumberValidationService.swift
//  MVP
//


import Foundation

struct PhoneNumberValidationService {
    static func validatePhoneNumber(_ number: String) -> Bool {
        let phoneRegex = #"^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return predicate.evaluate(with: number)
    }
}
