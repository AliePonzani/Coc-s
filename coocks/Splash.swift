//
//  ContentView.swift
//  AppCooks
//
//  Created by JOSE JOAQUIN JULCAMORO BUSTAMANTE on 27/08/24.
//
 
import SwiftUI

struct Splash: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive{
            Presentation()
        } else{
            VStack {
                VStack{
                    Image("splash")
                        .resizable()
                        .imageScale(.large)
                        .scaledToFit()
                    Text("Coock`s")
                        .font(Font.custom("Pragati Narrow", size: 64))
                        .foregroundColor(.black.opacity(0.80))
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1
                        self.opacity = 1
                    }
                }
                
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    withAnimation{
                        self.isActive = true
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    Splash()
}
