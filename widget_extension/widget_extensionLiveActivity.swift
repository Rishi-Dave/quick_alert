//
//  widget_extensionLiveActivity.swift
//  widget_extension
//
//  Created by Rishi Dave on 11/18/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct widget_extensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct widget_extensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: widget_extensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension widget_extensionAttributes {
    fileprivate static var preview: widget_extensionAttributes {
        widget_extensionAttributes(name: "World")
    }
}

extension widget_extensionAttributes.ContentState {
    fileprivate static var smiley: widget_extensionAttributes.ContentState {
        widget_extensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: widget_extensionAttributes.ContentState {
         widget_extensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: widget_extensionAttributes.preview) {
   widget_extensionLiveActivity()
} contentStates: {
    widget_extensionAttributes.ContentState.smiley
    widget_extensionAttributes.ContentState.starEyes
}
