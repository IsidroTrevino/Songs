//
//  SongsWidget.swift
//  SongsWidget
//
//  Created by Isidro Treviño and Debanhi Medina on 08/10/24.
//

import WidgetKit
import SwiftUI

struct SongEntry: TimelineEntry {
    let date: Date
    let song: Song
}

struct Provider: TimelineProvider {
    @MainActor
    func placeholder(in context: Context) -> SongEntry {
        SongEntry(date: Date(), song: SampleData.shared.song)
    }
    
    @MainActor
    func getSnapshot(in context: Context, completion: @escaping (SongEntry) -> Void) {
        let entry = SongEntry(date: Date(), song: SampleData.shared.song)
        completion(entry)
    }
    
    @MainActor
    func getTimeline(in context: Context, completion: @escaping (Timeline<SongEntry>) -> Void) {
        let currentDate = Date()
        let entry = SongEntry(date: currentDate, song: SampleData.shared.randomSong())
        let nextUpdateDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        completion(timeline)
    }
}


struct SongsWidgetEntryView: View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            smallWidgetView
        case .systemMedium:
            mediumWidgetView
        case .systemLarge:
            largeWidgetView
        default:
            mediumWidgetView
        }
    }

    private var smallWidgetView: some View {
        VStack(alignment: .center) {
            Image(entry.song.albumImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(entry.song.name)
                .font(.headline)
                .bold()
                .lineLimit(1)
            
            Text("by \(entry.song.band)")
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding()
        .background(Color(.systemBackground))
        .containerBackground(Color(.systemBackground), for: .widget)
        .widgetURL(entry.song.url)
    }

    private var mediumWidgetView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Song of the Day")
                .font(.title2)
                .fontWeight(.semibold)

            HStack(alignment: .top, spacing: 12) {
                Image(entry.song.albumImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.song.name)
                        .font(.headline)
                        .bold()
                        .lineLimit(1)
                    
                    Text("by \(entry.song.band)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Text("\(entry.song.plays) listens")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                .padding(.vertical, 4)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemBackground))
        .containerBackground(Color(.systemBackground), for: .widget)
        .widgetURL(entry.song.url)
    }

    private var largeWidgetView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Song of the Day")
                .font(.title)
                .bold()
            
            HStack(alignment: .top, spacing: 12) {
                Image(entry.song.albumImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 8) {
                    Text(entry.song.name)
                        .font(.title)
                        .bold()
                        .lineLimit(1)

                    Text("by \(entry.song.band)")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .lineLimit(1)

                    Text("\(entry.song.plays) listens")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                .padding(.vertical, 8)
            }
            .padding(.horizontal)

            Text(entry.song.desc)
                .font(.body)
                .foregroundColor(.secondary)
                .padding([.horizontal, .bottom])
                .lineLimit(8)
        }
        .padding()
        .background(Color(.systemBackground))
        .containerBackground(Color(.systemBackground), for: .widget)
        .widgetURL(entry.song.url)
    }
}

struct SongsWidget: Widget {
    let kind: String = "SongsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SongsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Song of the Day")
        .description("Displays a random song each day.")
    }
}

#Preview(as: .systemSmall) {
    SongsWidget()
} timeline: {
    SongEntry(date: Date(), song: SampleData.shared.song)
}

#Preview(as: .systemMedium) {
    SongsWidget()
} timeline: {
    SongEntry(date: Date(), song: SampleData.shared.song)
}

#Preview(as: .systemLarge) {
    SongsWidget()
} timeline: {
    SongEntry(date: Date(), song: SampleData.shared.song)
}
