//
//  SavingView.swift
//  Trolley
//
//  Created by Romain Choulet on 25/01/2021.
//

import SwiftUI

struct SavingView: View {
    @State var angle: Double = 0.0
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Saving...")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            Image(systemName: "arrow.2.circlepath")
//                .foregroundColor(.blue)
//                .padding()
                .rotationEffect(Angle(degrees: 360.0))
                .animation(self.foreverAnimation)
                //.rotationEffect(.degrees())
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct SavingView_Previews: PreviewProvider {
    static var previews: some View {
        SavingView()
    }
}
