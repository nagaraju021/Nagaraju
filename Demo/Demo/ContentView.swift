//
//  ContentView.swift
//  Demo
//
//  Created by Salapaka Prasanthi on 15/08/23.
//

import SwiftUI
//import combine

struct ContentView: View {
        @State private var countryCode: String = "+91"
        @State private var phoneNumber: String = ""
        @State private var showAlert: Bool = false
        @State private var alertMessage: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Get OTP")
                .font(.title)
               // .padding(1)
            
            
            Text("Enter Your")
                .font(.largeTitle)
                .padding(0)
            Text("Phone Number")
                .font(.largeTitle)
            
            VStack {
                TextField("Country Code", text: $countryCode)
                    .padding()
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                Button("Continue") {
                    handleContinueButtonTapped()
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(50)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
        }
        
    }
        
        func performPhoneNumberAPI(phoneNumber: String) {
            let apiUrl = URL(string: "https://app.co/v1/users/phone_number_login")!
            var request = URLRequest(url: apiUrl)
            request.httpMethod = "POST"
            let parameters: [String: Any] = ["number": phoneNumber]
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("API Success: \(json)")
                        DispatchQueue.main.async {
                            navigateToScreen2()
                        }
                    } catch {
                        DispatchQueue.main.async {
                            showAlert(message: error.localizedDescription)
                        }
                    }
                } else if let error = error {
                    DispatchQueue.main.async {
                        showAlert(message: error.localizedDescription)
                    }
                }
            }.resume()
        }
        
        func handleContinueButtonTapped() {
                       let phoneNumber = "\(countryCode)\(self.phoneNumber)"
                       performPhoneNumberAPI(phoneNumber: phoneNumber)
                   }
        func navigateToScreen2() {
                Screen2()
            }
            
            func showAlert(message: String) {
                self.alertMessage = message
                self.showAlert = true
            }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
