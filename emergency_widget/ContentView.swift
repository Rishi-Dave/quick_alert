//
//  ContentView.swift
//  emergency_widget
//
//  Created by Rishi Dave on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    func roundedButton(text: String, action: @escaping () -> Void) -> some View {
            return Button(action: action) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
            }
            .padding()
        }
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                }
                HStack{
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                }
                HStack{
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                    roundedButton(text: "Tap me", action: {
                                    print("Button tapped!")
                                })
                }
                Spacer();
            }
            .navigationTitle("Qyk Alert")
        }
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
