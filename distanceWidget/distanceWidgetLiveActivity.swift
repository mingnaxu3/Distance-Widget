//
//  distanceWidgetLiveActivity.swift
//  distanceWidget
//
//  Created by Ming Xu on 12/24/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct distanceWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct distanceWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: distanceWidgetAttributes.self) { context in
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

extension distanceWidgetAttributes {
    fileprivate static var preview: distanceWidgetAttributes {
        distanceWidgetAttributes(name: "World")
    }
}

extension distanceWidgetAttributes.ContentState {
    fileprivate static var smiley: distanceWidgetAttributes.ContentState {
        distanceWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: distanceWidgetAttributes.ContentState {
         distanceWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: distanceWidgetAttributes.preview) {
   distanceWidgetLiveActivity()
} contentStates: {
    distanceWidgetAttributes.ContentState.smiley
    distanceWidgetAttributes.ContentState.starEyes
}
