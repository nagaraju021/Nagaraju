
//

import SwiftUI
//import combine

struct Screen2: View {
        @State private var otp: String = "1"
        @State private var isNavigationActive = false
       
       var body: some View {
           VStack {
               Text("Enter The OTP")
                   .font(.title)
               TextField("Enter OTP", text: $otp)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               Button(action: {
                   //makeOTPAPICall()
               }) {
                   Text("Continue")
                       .padding()
                       .background(Color.yellow)
                       .foregroundColor(.black)
                       .cornerRadius(50)
               }
               .padding()
               
           }
           .navigationBarTitle("Enter OTP")
       }
    
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2()
    }
}
