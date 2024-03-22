//
//  ContentView.swift
//  MVP
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var presenter: PhoneNumberPresenter
    
    var body: some View {
        VStack {
            TextField("Введите номер телефона", text: $presenter.phoneNumber)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                presenter.formatPhoneNumber()
            }) {
                Text("Преобразовать")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Text(presenter.resultText)
                .padding()
        }
        .padding()
    }
}

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: PhoneNumberPresenter(formatter: PhoneNumberFormatter()))
    }
}
