
/*
import Foundation

 func makeOTPAPICall() {
    guard let url = URL(string: "https://app.co/v1/users/verify_otp") else {
        return
    }
    
    let request = OTPRequest(number: "+919876543212", otp: otp)
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        urlRequest.httpBody = try JSONEncoder().encode(request)
    } catch {
        print("Encoding Error: \(error)")
        return
    }
    
    let publisher = URLSession.shared.dataTaskPublisher(for: urlRequest)
        .map(\.data)
        .decode(type: OTPResponse.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
    
    let cancellable = publisher.sink(
        receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("API Error: \(error)")
            }
        },
        receiveValue: { response in
            let authToken = response.authToken

            self.isNavigationActive = true
        }
    )
    
    cancellable.store(in: &cancellables)
}
*/
