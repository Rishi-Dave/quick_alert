import SwiftUI
import WidgetKit
import MessageUI


struct WidgetView: View {

    @State private var isShowingMailView = false
    @State private var isMessageComposePresented = false
    
    var body: some View {
            VStack{
                Button("Emergency Alert") {
                    print("hi")
                    self.isMessageComposePresented.toggle()
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isMessageComposePresented, content: {
                    MessageComposeView(isPresented: $isMessageComposePresented,messageBody: "Help please please")
                })
            }
        .widgetBackground(Color.black)
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
        .previewContext(WidgetPreviewContext(family: .systemMedium)) }
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

