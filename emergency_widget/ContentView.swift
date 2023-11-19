//
//  ContentView.swift
//  emergency_widget
//
//  Created by Rishi Dave on 11/18/23.
//

import SwiftUI
import MessageUI
import Contacts


struct ContentView: View {
    @State private var message: String = ""
    @State private var selection: String? = nil
    @State var enteredText: String
    @State private var isMessageComposePresented = false
    let array = ["I'm in a fire", "Help me I'm Lost", "The power just went out", "I'm intoxicated right now and cannot text, please help", "There's an active shooter and I cannot text, please call for help", "I got into a car crash", "I got a head injury, I might have a concussion", "I'm having a heart attack", "I'm injured"]
    
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
                            //sendMessage(num: 5108949147, problem: 0)
                            self.isMessageComposePresented.toggle()

                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented, messageBody: array[0])
                        })
                        
                        roundedButton(text: "Lost") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 1)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented, messageBody: array[1])
                        })
                        roundedButton(text: "Power Outage") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                           // sendMessage(num: 5108949147, problem: 2)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented,messageBody: array[2])
                        })
                    }

                    HStack {
                        roundedButton(text: "Inotoxicated") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 3)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented,messageBody: array[3])
                        })
                        roundedButton(text: " Active Shooter") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 4)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented,messageBody: array[4])
                        })
                        roundedButton(text: "Car crash") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 5)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented, messageBody: array[5])
                        })
                    }

                    HStack {
                        roundedButton(text: "Head Injury") {
                            print("Someone has had a head injury")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 6)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented ,messageBody: array[6])
                        })
                        roundedButton(text: "Heart Attack") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 7)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented,messageBody: array[7])
                        })
                        roundedButton(text: "General Injury") {
                            print("Button tapped!")
                            self.isMessageComposePresented.toggle()
                            //sendMessage(num: 5108949147, problem: 8)
                        }
                        .sheet(isPresented: $isMessageComposePresented, content: {
                            MessageComposeView(isPresented: $isMessageComposePresented,messageBody: array[8])
                        })
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

struct MessageComposeView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let messageBody: String
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let controller = MFMessageComposeViewController()
        controller.recipients = ["+123456789"] // Replace with the recipient's phone number
        controller.body = messageBody
        controller.messageComposeDelegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }

    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        @Binding var isPresented: Bool

        init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
        }

        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            isPresented = false
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
