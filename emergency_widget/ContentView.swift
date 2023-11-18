//
//  ContentView.swift
//  emergency_widget
//
//  Created by Rishi Dave on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = ""
    @State private var selection: String? = nil

    func roundedButton(text: String, action: @escaping () -> Void) -> some View {
        return Button(action: action) {
            Text(text)
                .font(.headline)
                .foregroundColor(.green)
                .frame(width: 120, height: 200)
                .padding()
        }
        .frame(width: 120, height: 200)
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
//                VStack {
//                                NavigationLink(destination: Page1()) {
//                                    Text("Go to Page 1")
//                                        .padding()
//                                        .background(Color.blue)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(10)
//                                }
//
//                                NavigationLink(destination: Page2()) {
//                                    Text("Go to Page 2")
//                                        .padding()
//                                        .background(Color.green)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(10)
//                                }
//                            }
//                            .navigationTitle("Home")
            }
        }
    }
}
struct Page1: View {
    var body: some View {
        Text("This is Page 1")
            .navigationTitle("Page 1")
    }
}

struct Page2: View {
    var body: some View {
        Text("This is Page 2")
            .navigationTitle("Page 2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
