//
//  PhoneNumberPresenter.swift
//  MVP
//


import Foundation

final class PhoneNumberPresenter: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var resultText: String = ""
    
    private let formatter: PhoneNumberFormatter
    private let maxPhoneNumberLength = 10
    
    init(formatter: PhoneNumberFormatter) {
        self.formatter = formatter
    }
    
    func formatPhoneNumber() {
        if !isValidPhoneNumberLength() {
            resultText = "Ошибка: неверная длина номера"
            return
        }
        
        guard let formattedNumber = formatter.formatPhoneNumber(phoneNumber) else {
            resultText = "Ошибка: неверный формат номера"
            return
        }
        resultText = formattedNumber
    }
    
    private func isValidPhoneNumberLength() -> Bool {
        let digitsOnly = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        if (phoneNumber.hasPrefix("+7") && phoneNumber.count == 12) {
            return digitsOnly.count <= maxPhoneNumberLength + 2
        } else if (phoneNumber.hasPrefix("8") && phoneNumber.count == 11)  {
            return digitsOnly.count <= maxPhoneNumberLength + 1
        } else {
            return digitsOnly.count == maxPhoneNumberLength
        }
    }
}

