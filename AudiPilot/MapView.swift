//
//  MapView.swift
//  AudiPilot
//
//  Created by Dambi on 06.04.25
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.520144, longitude: 13.327068),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    var body: some View {
        ZStack {
            Map(position: .constant(.region(region))) {
                Marker(coordinate: region.center) {
                    VStack {
                        Image(systemName: "car.fill")
                            .padding(8)
                            .background(Circle().fill(.blue))
                        Text("e-tron GT")
                            .font(.caption)
                    }
                }
            }
            AutoDetectPanel()
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        SystemButtons(icon: "chevron.left")
                    }
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkBg"))
        .foregroundColor(Color.black)
        .navigationBarHidden(true)
    }
}

#Preview {
    MapView()
}

struct AutoDetectPanel: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Parked Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomDivider()
                    Label("Franklinstraße 24, 10587 Berlin", systemImage: "location.fill")
                        .font(.footnote)
                        .opacity(0.5)
                }
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("AudiPilot Summon")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Press hold to sommon your car")
                            .font(.footnote)
                            .opacity(0.5)
                        CustomDivider()
                        FullButton(text: "Summon Car", icon: "car.front.waves.left.and.right.and.up.fill")
                        HStack {
                            FullButton(text:"Pilot Park", icon:"car.top.lane.dashed.badge.steeringwheel.fill")
                            FullButton(text:"Pilot Depart", icon:"car.top.radiowaves.rear.left.car.top.front.fill")
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkBg"))
            .foregroundColor(Color.white)
            .navigationBarHidden(true)
        }
    }
}
