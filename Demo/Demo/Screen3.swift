

import SwiftUI

struct Screen3: View {
    var body: some View {
        VStack {
            Text("Notes")
                .font(.largeTitle)
            Text("Personal messages to you")
                .font(.title2)
                .padding(.bottom,15)
            Image("Image")
                .resizable()
                .frame(width: 500, height: 250)
            HStack{
                VStack(alignment: .leading){
                    Text("Intersed In You")
                    Text("Premium members can")
                    Text("view all their likes at once")
                }
                    .padding(.trailing,30)
                Button(action: {
                }) {
                    Text("Upgrade")
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                }
            }
            HStack{
                Image("Image1")
                    .resizable()
                    .frame(width: 200, height: 200)
                Image("Image1")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Spacer()
            
        }
        
    }
}

struct Screen3_Previews: PreviewProvider {
    static var previews: some View {
        Screen3()
    }
}
