//
//  ActionComponents.swift
//  AudiPilot
//
//  Created by Dambi on 06.04.25
//

import SwiftUI

struct ActionComponents: View {
    var body: some View {
        //        ActionNotification(open: .constant(true), icon: "car.side.rear.open.fill", text: "Open trunk")
        //        VoiceCommandView(open: .constant(true),  text: "Open trunk")
        //        MediaPlayerView()
        //        ChargingView()
    }
}

#Preview {
    ActionComponents()
}

struct ActionNotification: View {
    @Binding var open: Bool
    var icon: String
    var text: String
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.medium)
                Spacer()
                Button(action: {}) {
                    Text("Close")
                        .font(.subheadline)
                        .opacity(0.5)
                }
            }
            .padding(20)
            .foregroundColor(Color.white)
            .background(Color("DarkBg"))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct VoiceCommandView: View {
    @Binding var open: Bool
    var text: String
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image("Wave")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack(alignment: .bottom, spacing: 20) {
                HStack {
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    Text(text)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                }
                .padding(.bottom, 15)
                Spacer()
                Button(action:{
                    withAnimation{
                        open = false
                    }
                }){
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("DarkBg"))
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color("RedWave"))
            .foregroundColor(Color("DarkBg"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct MediaPlayerView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                HStack(alignment: .center, spacing: 10) {
                    Image("song")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    VStack(alignment: .leading, spacing: 5){
                        Text("I Want to Break Free")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Queen")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .opacity(0.5)
                    }
                    Spacer()
                }
                VStack(spacing: 5) {
                    HStack {
                        Text("2:15")
                        Spacer()
                        Text("-5:25")
                    }
                    .font(.system(size: 15, weight: .medium, design: .monospaced))
                    .opacity(0.8)
                    ZStack(alignment: .leading) {
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("RedWave")
                            .frame(maxWidth: 200)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Blue")
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 192)
                    }
                }
                CustomDivider()
                HStack {
                    HStack(alignment: .center, spacing: 20){
                        Button(action: {}) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        Button(action: {}) {
                            Image(systemName: "pause.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        Button(action: {}) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 20){
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        Button(action: {}) {
                            RadialGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.1)]), center: .leading, startRadius: 15, endRadius: 35)
                                .frame(width: 44, height: 44)
                                .mask{
                                    Image(systemName: "speaker.wave.3.fill")
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                }
                        }
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkBg"))
            .foregroundColor(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ChargingView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Label("220miles", systemImage: "bolt.fill")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("Green"))
                    Text("2hrs 15min remaining")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .opacity(0.8)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Charging level: 85%")
                        .font(.system(size: 13, weight: .medium, design: .monospaced))
                        .opacity(0.8)
                    ZStack(alignment: .leading) {
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("RedWave")
                            .frame(maxWidth: 200)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Blue")
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 192)
                    }
                }
                CustomDivider()
                Button(action: {}) {
                    Text("Stop charging")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color("Red"))
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 20)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkBg"))
            .foregroundColor(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
