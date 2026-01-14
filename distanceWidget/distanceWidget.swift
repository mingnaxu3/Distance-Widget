//
//  distanceWidget.swift
//  distanceWidget
//
//  Created by Ming Xu on 12/24/25.
//

import WidgetKit
import SwiftUI

// MARK: - Timeline Entry
struct DistanceEntry: TimelineEntry {
    let date: Date
    let distanceMiles: Double?
}

struct Provider: TimelineProvider {
func placeholder(in context: Context) -> DistanceEntry {
    DistanceEntry(date: Date(), distanceMiles: nil)
}


func getSnapshot(in context: Context, completion: @escaping (DistanceEntry) -> ()) {
    let sharedDistance = UserDefaults(suiteName: "group.com.mingna.distanceappnew")
    let dist = sharedDistance?.double(forKey: "distanceMiles") ?? 0
    
    let entry = DistanceEntry(date: Date(), distanceMiles: dist)
    completion(entry)
}


func getTimeline(in context: Context, completion: @escaping (Timeline<DistanceEntry>) -> ()) {
    let sharedDefaults = UserDefaults(suiteName: "group.com.mingna.distanceappnew")
    let distance = sharedDefaults?.double(forKey: "distanceMiles")


    let entry = DistanceEntry(date: Date(), distanceMiles: distance)


    let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(900))) // refresh every 15 min
    completion(timeline)
    }
}

//MARK: - dottedLine struct
struct DottedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x:rect.width, y: rect.midY))
        return path
    }
    
}
//MARK: - HeartIcon struct
struct HeartSymbolView: View {
    var body: some View {
        
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 32, height: 30)
            .foregroundColor(Color(red: 169/255, green: 31/255, blue: 36/255))
    }
}

// MARK: - distanceWidgetEntryView

struct distanceWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {

        // distance is greater than 1000
        if let distance = entry.distanceMiles, distance > 1000 {
           
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0.82, blue: 0.86))
                    .frame(width: 64, height: 64)
                    .offset(x: -120)
                
                Text("M")
                    .offset(x: -120)
                    .font(.custom("Cochin-Bold", size: 35))
                
                Circle()
                    .fill(Color(red: 203/255, green: 238/255, blue: 250/255))
                    .frame(width: 64, height: 64)
                    .offset(x: 120)
                Text("C")
                    .offset(x:120)
                    .font(.custom("Cochin-Bold", size: 35))
                
                DottedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 173)
                Text(String(distance) + " miles")
                    .offset(y:-30)
                    .font(.custom("Cochin-Bold", size: 20))
                HeartSymbolView()
                
                
            }
        }
        // distance is between 701-1000 miles
        else if let distance = entry.distanceMiles, distance > 700 {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0.82, blue: 0.86))
                    .frame(width: 64, height: 64)
                    .offset(x: -90)
                
                Text("M")
                    .offset(x: -90)
                    .font(.custom("Cochin-Bold", size: 35))
                
                Circle()
                    .fill(Color(red: 203/255, green: 238/255, blue: 250/255))
                    .frame(width: 64, height: 64)
                    .offset(x: 90)
                Text("C")
                    .offset(x:90)
                    .font(.custom("Cochin-Bold", size: 35))
                
                DottedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 120)
                Text(String(distance) + " miles")
                    .offset(y:-30)
                    .font(.custom("Cochin-Bold", size: 20))
                HeartSymbolView()
                
                
            }
            
        }
        // distance is between 401-700 miles
        else if let distance = entry.distanceMiles, distance > 400 {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0.82, blue: 0.86))
                    .frame(width: 64, height: 64)
                    .offset(x: -80)
                
                Text("M")
                    .offset(x: -80)
                    .font(.custom("Cochin-Bold", size: 35))
                
                Circle()
                    .fill(Color(red: 203/255, green: 238/255, blue: 250/255))
                    .frame(width: 64, height: 64)
                    .offset(x: 80)
                Text("C")
                    .offset(x:80)
                    .font(.custom("Cochin-Bold", size: 35))
                
                DottedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 95)
                Text(String(distance) + " miles")
                    .offset(y:-30)
                    .font(.custom("Cochin-Bold", size: 20))
                HeartSymbolView()
                
                
            }
            
        }
        // distance is between 100-399 miles
        else if let distance = entry.distanceMiles, distance > 100 {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0.82, blue: 0.86))
                    .frame(width: 64, height: 64)
                    .offset(x: -60)
                
                Text("M")
                    .offset(x: -60)
                    .font(.custom("Cochin-Bold", size: 35))
                
                Circle()
                    .fill(Color(red: 203/255, green: 238/255, blue: 250/255))
                    .frame(width: 64, height: 64)
                    .offset(x: 60)
                Text("C")
                    .offset(x:60)
                    .font(.custom("Cochin-Bold", size: 35))
                
                DottedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 62)
                Text(String(distance) + " miles")
                    .offset(y:-30)
                    .font(.custom("Cochin-Bold", size: 15))
                HeartSymbolView()
                
                
            }
        }
        
        // distance is less than 100 miles
        else if let distance = entry.distanceMiles, distance  > 0  {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0.82, blue: 0.86))
                    .frame(width: 64, height: 64)
                    .offset(x: -30)
                
                Text("M")
                    .offset(x: -30)
                    .font(.custom("Cochin-Bold", size: 35))
                
                Circle()
                    .fill(Color(red: 203/255, green: 238/255, blue: 250/255))
                    .frame(width: 64, height: 64)
                    .offset(x: 30)
                Text("C")
                    .offset(x:30)
                    .font(.custom("Cochin-Bold", size: 35))
                
                
                Text(String(distance) + " miles")
                    .offset(y:-40)
                    .font(.custom("Cochin-Bold", size: 15))
                HeartSymbolView()
                
                
            }
        }
        
        
        else {
                Text("Waiting for partner... ")
                    .font(.custom("Cochin", size: 20))
            }
                
               
            
            
            
            
            
            
            }
        
        }
        
        
        



// MARK: - distanceWidget
// widget configuration
struct distanceWidget: Widget {
    let kind: String = "distanceWidget"
    let backgroundColor = Color.widgetBackground
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                distanceWidgetEntryView(entry: entry)
                    .containerBackground(backgroundColor, for: .widget)
            } else {
                distanceWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
        
    }
}

// MARK: - Preview
#Preview(as: .systemMedium) {
    distanceWidget()
} timeline: {
    DistanceEntry(date: .now, distanceMiles: 1100)
    DistanceEntry(date: .now, distanceMiles: 750)
    DistanceEntry(date: .now, distanceMiles: 500)
    DistanceEntry(date: .now, distanceMiles: 250)
    DistanceEntry(date: .now, distanceMiles: 10)
    
}

