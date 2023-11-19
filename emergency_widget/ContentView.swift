//
//  ContentView.swift
//  emergency_widget
//
//  Created by Rishi Dave on 11/18/23.
//

import SwiftUI
import Contacts


struct ContentView: View {
    @State private var message: String = ""
    @State private var selection: String? = nil
    @State var enteredText: String
    
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
                        roundedButton(text: "Fire") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Lost") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Power Outage") {
                            print("Button tapped!")
                        }
                    }

                    HStack {
                        roundedButton(text: "Inotoxicated") {
                            print("Button tapped!")
                        }
                        roundedButton(text: " Active Shooter") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "Car crash") {
                            print("Button tapped!")
                        }
                    }

                    HStack {
                        roundedButton(text: "Head Injury") {
                            print("Someone has had a head injury")
                        }
                        roundedButton(text: "Heart Attack") {
                            print("Button tapped!")
                        }
                        roundedButton(text: "General Injury") {
                            print("Button tapped!")
                        }
                    }

                   
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack{
                        NavigationLink(destination: ContactsPage(enteredText: enteredText)) {
                            Text("Set Number")
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.green)
                                .cornerRadius(10)
                        }


                    }
                    
                }
                
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
                VStack {
                                            }
        }
    }
}

struct ContactsPage: View {
    
    @State var enteredText: String

    var body: some View {
        NavigationView {
            ZStack{
                RadialGradient(stops: [
                    .init(color: .white, location: 0.5),
                    .init(color: .green, location: 0.5)
                ], center: .top, startRadius: 200, endRadius: 600)
                .ignoresSafeArea()
                //--------------------------------------------------------------------------------
                
                //Text("This is Page 1")
                
                VStack {
                    TextField("Set Emergency Phone Number", text: $enteredText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .padding(.horizontal)
                    
                    Text("You entered: \(enteredText)")
                        .padding()
                        .foregroundColor(.blue) // You can customize the text color here
                    /*
                    NavigationLink(destination: ContentView()) {
                        Text("Enter")
                    }
                     */
                }
                
                
                
                
                //--------------------------------------------------------------------------------
                
            }
        }
            .navigationTitle("Set Phone Number")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(enteredText:"")
    }
}
