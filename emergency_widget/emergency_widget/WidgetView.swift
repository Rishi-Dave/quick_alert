import SwiftUI
import WidgetKit
import MessageUI


struct WidgetView: View {

    @State private var isShowingMailView = false

    var body: some View {
            VStack{
                Button("Send Email") {
                    isShowingMailView.toggle()
                }
                .sheet(isPresented: $isShowingMailView) {
                    MailView(isShowing: $isShowingMailView)
                }
                .buttonStyle(.borderedProminent)
            }
            .widgetBackground(Color.black)
            
        }
        
        

    
    
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView() .previewContext(WidgetPreviewContext(family: .systemMedium))   }
}



struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool

        init(isShowing: Binding<Bool>) {
            _isShowing = isShowing
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            isShowing = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing)
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = context.coordinator
        viewController.setSubject("Subject")
        viewController.setToRecipients(["recipient@example.com"])
        viewController.setMessageBody("Body of the email", isHTML: false)
        return viewController
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        // Update the view controller if needed
    }
}

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
