//
//  ContentView.swift
//  AudiPilot
//
//  Created by Dambi on 04.04.25
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 15) {
                        HomeHeaderCap()
                        CustomDivider()
                        CarBlock()
                        CustomDivider()
                        CustomWrapper(title: "Quick Controls", showEdit: true, actionItems: quickControls)
                        CustomDivider()
                        CustomWrapper(title: "Climate Controls", showEdit: true, actionItems: climateControls)
                        CustomDivider()
                        CustomWrapper(title: "Pilot Controls", actionItems: pilotControls)
                        CustomDivider()
                        AllSettings()
                        CustomizeButtom()
                    }
                    .padding()
                }
                VoiceActivationButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkBg"))
            .foregroundColor(Color.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}

struct VoiceActivationButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "mic.fill")
                    .font(
                        .system(size: 24, weight: .semibold, design: .default)
                    )
                    .foregroundColor(.white)
                    .frame(width: 64, height: 64)
                    .background(Color("Red"))
                    .foregroundColor(Color("DarkBg"))
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeHeaderCap: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Audi Pilot".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .foregroundStyle(Color.white)
                    .background(Color("Red"))
                    .clipShape(Capsule())
                Text("e-tron GT")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Spacer()
            HStack {
                Button(action: {}) {
                    SystemButtons(icon: "lock.fill")
                }
                Button(action: {}) {
                    SystemButtons(icon: "gear")
                }
            }
        }
        .padding(.top)
    }
}

struct CarBlock: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment: .center) {
                HStack {
                    Image(systemName: "battery.75")
                    Text("264 miles".uppercased())
                }
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundColor(Color("Green"))
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Since: 3:45 PM")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            Image("Auto")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CustomBlocks: View {
    var title: String
    var showEdit: Bool = false
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            if showEdit {
                Button(action: {}) {
                    Text("Edit")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                }
            }
        }
    }
}

struct CustomWrapper: View {
    var title: String
    var showEdit: Bool = false
    var actionItems: [ActionItem]
    var body: some View {
        VStack {
            CustomBlocks(title: title, showEdit: showEdit)
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(actionItems, id: \.self) { item in
                            Button(action: {}) {
                                ActionButton(icon: item.icon)
                                    .frame(width: geometry.size.width / CGFloat(min(actionItems.count, 4)))
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .frame(minWidth: geometry.size.width)
                    .padding(.vertical, 12)
                }
                .edgesIgnoringSafeArea(.horizontal)
            }
            .frame(height: 65)
        }
    }
}

let quickControls: [ActionItem] = [
    ActionItem(icon: "bolt.car.fill"),
    ActionItem(icon: "car.side.front.open.fill"),
    ActionItem(icon: "car.side.rear.open.fill"),
    ActionItem(icon: "car.side.arrowtriangle.up.arrowtriangle.down.fill"),
]

let climateControls: [ActionItem] = [
    ActionItem(icon: "wind"),
    ActionItem(icon: "snowflake"),
    ActionItem(icon: "flame"),
    ActionItem(icon: "car.side.air.fresh.fill"),
]

let pilotControls: [ActionItem] = [
    ActionItem(icon: "shareplay"),
    ActionItem(icon: "autostartstop"),
    ActionItem(icon: "bolt.badge.automatic.fill"),
    ActionItem(icon: "figure.seated.side.automatic"),
]

struct AllSettings: View {
    var body: some View {
        VStack {
            CustomBlocks(title: "All Settings")
            LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                NavigationLink(destination: AutoControlView()){
                    SettingGrid(icon: "gauge.open.with.lines.needle.33percent.and.arrowtriangle", title: "Controls", subtitle: "Media and more", hasSubtitle: true, backgroundColor: Color("Blue"))
                }
                SettingGrid(icon: "cloud.sun.fill", title: "Climate", subtitle: "Weather and more", hasSubtitle: true)
                NavigationLink(destination: MapView()){
                    SettingGrid(icon: "car.rear.road.lane.distance.5", title: "Pilot", subtitle: "Auto mode", hasSubtitle: true)
                }
                SettingGrid(icon: "gearshape.2.fill", title: "Advance", subtitle: "Advanced settings", hasSubtitle: true)
            }
            
        }
    }
}

struct SettingGrid: View {
    var icon: String
    var title: String
    var subtitle: String = ""
    var hasSubtitle: Bool = false
    var backgroundColor: Color = Color.white.opacity(0.05)
    var body: some View {
        HStack(alignment: .center, spacing: 7 ) {
            Image(systemName: icon)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .fixedSize(horizontal: true, vertical: false)
                if hasSubtitle {
                    Text(subtitle.uppercased())
                        .font(.system(size: 8, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                }
            }
            .padding(.leading, 5)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
    }
}


struct CustomizeButtom: View {
    var body: some View {
        Button(action:{}){
            Text("Customize")
                .font(.caption)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.05))
                .clipShape(Capsule())
        }
    }
}
