//
//  AutoControlView.swift
//  AudiPilot
//
//  Created by Dambi on 05.04.25
//

import SwiftUI

let audioControls: [ActionItem] = [
    ActionItem(icon:"speaker.slash.fill"),
    ActionItem(icon:"speaker.wave.3.fill"),
    ActionItem(icon:"playpause.fill"),
    ActionItem(icon:"phone.fill"),
    ActionItem(icon:"iphone.gen1.slash")
]

public struct AutoControlView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var toggleConnection: Bool = false
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            SystemButtons(icon: "chevron.left")
                        }
                        Spacer()
                    }
                    Text("Media Control")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                }
                CustomDivider()
                AudioButton()
                CustomDivider()
                AudioControlActions()
                CustomDivider()
                HStack {
                    Text("Wireless Connect")
                        .fontWeight(.medium)
                    Spacer()
                    Toggle("", isOn: $toggleConnection)
                }
                if toggleConnection {
                    Text("Phone Connected")
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkBg"))
        .foregroundColor(Color.white)
        .navigationBarHidden(true)
    }
}

struct AutoControlView_Previews: PreviewProvider {
    static var previews: some View {
        AutoControlView()
    }
}

struct AudioButton: View {
    var body: some View {
        Button(action: {}){
            Label("Audio", systemImage: "speaker.wave.1.arrowtriangles.up.right.down.left")
                .font(.system(size: 20, weight: .medium, design: .default))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }
}

struct AudioControlActions: View {
    var body: some View {
        VStack(spacing: 45) {
            HStack {
                Spacer()
                ActionButton(icon: audioControls[0].icon)
                Spacer()
                ActionButton(icon: audioControls[1].icon)
                Spacer()
                ActionButton(icon: audioControls[2].icon)
                Spacer()
            }
            HStack {
                Spacer()
                ActionButton(icon: audioControls[3].icon)
                Spacer()
                ActionButton(icon: audioControls[4].icon)
                Spacer()
            }
        }
    }
}
