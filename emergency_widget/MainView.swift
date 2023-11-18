//
//  alerts.swift
//  emergency_widget
//
//  Created by Atharva Nevasekar on 11/18/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView{
            Group{
                ContentView().tabItem{
                    Label("Menu",systemImage: "line.dash")
                 } 
            }.toolbarBackground(.visible, for: .tabBar)
        }
    }
}
//
//struct alerts_preview: PreviewProvider{
//    static var previews: some View{
//        alerts().environmentObject(Order())
//    }
//}
 

#Preview {
    MainView()
}
