//
//  ContentView.swift
//  emergency_widget
//
//  Created by Rishi Dave on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = ""

    func roundedButton(text: String, action: @escaping () -> Void) -> some View {
        return Button(action: action) {
            Text(text)
                .font(.headline)
                .foregroundColor(.green)
                .padding()
        }
        .frame(width: 120, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white) // Set the fill color to white
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 2) // Set the border color to green
                            )
        )
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(stops: [
                    .init(color: .white, location: 0.5),
                    .init(color: .green, location: 0.5)
                ], center: .top, startRadius: 200, endRadius: 600)
                .ignoresSafeArea()

                VStack {
                    Spacer()
                    HStack {
                        roundedButton(text: "Alert1") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Alert2") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Alert3") {
                            print("Button tapped!")
                        }
                    }

                    HStack {
                        roundedButton(text: "Alert4") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Alert5") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Alert6") {
                            print("Button tapped!")
                        }
                    }

                    HStack {
                        roundedButton(text: "Alert7") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Alert8") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Alert9") {
                            print("Button tapped!")
                        }
                    }

                    TextField("Type your message", text: $message)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                    Button(action: {
                                    // Handle the send button action here
                                    print("Sending message: \(message)")
                                    // You can perform additional actions, such as sending the message to a server or updating a chat view.
                                }) {
                                    Text("Send")
                                        .padding()
                                        .foregroundColor(.green)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                }
                
                //--------------------------------------------
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Qyk Alert")
                            .font(.largeTitle.bold())
                            .accessibilityAddTraits(.isHeader)
                            .foregroundColor(.green)
                    }
                }
                //.navigationBarTitle("Qyk Alert")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
