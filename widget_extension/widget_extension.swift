//
//  widget_extenstion.swift
//  widget_extenstion
//
//  Created by Rishi Dave on 11/18/23.
//

import WidgetKit
import SwiftUI

struct widget_extension: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "YourWidgetKind", provider: Provider()) { entry in
            WidgetViewEntryView(entry: entry)
        }
        .configurationDisplayName("Your Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        let entry = WidgetEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntry>) -> ()) {
        let entries: [WidgetEntry] = [WidgetEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct WidgetEntry: TimelineEntry {
    var date: Date
}

struct WidgetViewEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        WidgetView()
    }
}



struct widget_extension_Previews: PreviewProvider {
    static var previews: some View {
        WidgetViewEntryView(entry: WidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
