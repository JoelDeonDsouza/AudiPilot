//
//  CommonComponents.swift
//  AudiPilot
//
//  Created by Dambi on 06.04.25
//

import Foundation
import SwiftUI

struct SystemButtons: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(.ultraThinMaterial, in: Circle())
            .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 0.5))
    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.25)
            .background(Color.white)
            .opacity(0.2)
    }
}

struct ActionButton: View {
    var icon: String
    var body: some View {
        VStack(alignment: .center) {
            SystemButtons(icon: icon)
        }
    }
}

struct ActionItem: Hashable {
    var icon: String
}


struct FullButton: View {
    var hasIcon: Bool = false
    var text: String
    var icon: String
    var body: some View {
        if icon.isEmpty{
            textButton
        } else {
            iconButton
        }
    }
    var iconButton : some View {
        Label(text, systemImage: icon)
            .font(.system(size: 20, weight: .medium, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
    var textButton: some View {
        Label("Audio", systemImage: "speaker.wave.1.arrowtriangles.up.right.down.left")
            .font(.system(size: 20, weight: .medium, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}
