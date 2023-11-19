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
            }
            .buttonStyle(.borderedProminent)
        }
        .containerBackground(.background, for: .widget)
    }
    
    
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
        .previewContext(WidgetPreviewContext(family: .systemMedium)) }
}





