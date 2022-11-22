//
//  _15_VenturaMenuBarApp.swift
//  015_VenturaMenuBar
//
//  Created by nikita on 22.11.2022.
//

import SwiftUI

@main
struct _15_VenturaMenuBarApp: App {
	var body: some Scene {
		MenuBarExtra {
			ControlCenterView()
		} label: {
			Image(systemName: "switch.2")
		}
		.menuBarExtraStyle(.window)
    }
	
	@ViewBuilder
	func ControlCenterView() -> some View {
		Grid(horizontalSpacing: 12, verticalSpacing: 12) { 
			GridRow(alignment: .top) { 
				VStack(spacing: 12) {
					ControlView(icon: "wifi.circle.fill", title: "Wi-Fi", subtitle: "Home WiFi")
					ControlView(icon: "wave.3.right.circle.fill", title: "Bluetooth", subtitle: "Magic Keyboard")
					ControlView(icon: "airplayvideo.circle.fill", title: "AirDrop", subtitle: "Contacts Only")
				}
				.padding(12)
				.background { 
					RoundedRectangle(cornerRadius: 12, style: .continuous)
						.fill(.ultraThinMaterial)
				}
				
				Grid(verticalSpacing: 12) {
					GridRow {
						HStack{
							Image(systemName: "moon.circle.fill")
								.font(.largeTitle)
								.symbolRenderingMode(.multicolor)
								.foregroundStyle(.purple, .primary)
							
							Text("Do Not Disturb")
								.font(.callout)
								.foregroundColor(.primary)
						}
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(12)
						.background { 
							RoundedRectangle(cornerRadius: 12, style: .continuous)
								.fill(.ultraThinMaterial)
						}
						.gridCellColumns(2)
					}
					
					GridRow { 
						SubControlView(icon: "rectangle.3.group", title: "Stage\nManager")
						SubControlView(icon: "rectangle.fill.on.rectangle.fill", title: "Screen\nMirroring")
					}
				}
				.gridCellUnsizedAxes(.vertical)
			}
			
			GridRow {
				VStack {
					DisabledSeeker(icon: "sun.max", title: "Display")
					DisabledSeeker(icon: "airpods.gen2", title: "Sound")
				}
				.gridCellColumns(2)
			}
		}
		.padding(10)
		.frame(width: screenSize.width / 5.5)
	}
	
	@ViewBuilder
	func DisabledSeeker(icon: String, title: String) -> some View {
		VStack(alignment: .leading, spacing: 5) { 
			Text(title)
				.font(.callout)
				.foregroundColor(.primary)
			
			ZStack(alignment: .leading) { 
				Capsule()
					.fill(.white)
					.opacity(0.25)
				
				Image(systemName: icon)
					.foregroundStyle(.thickMaterial)
					.padding(.leading, 8)
			}
			.frame(height: 25)
		}
		.padding(12)
		.background { 
			RoundedRectangle(cornerRadius: 12, style: .continuous)
				.fill(.ultraThinMaterial)
		}
	}
	
	@ViewBuilder
	func SubControlView(icon: String, title: String) -> some View {
		VStack(spacing: 4) { 
			Image(systemName: icon)
				.font(.title2)
			
			Text(title)
				.font(.caption)
				.multilineTextAlignment(.center)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background { 
			RoundedRectangle(cornerRadius: 12, style: .continuous)
				.fill(.ultraThinMaterial)
		}
	}
	
	@ViewBuilder
	func ControlView(icon: String, title: String, subtitle: String) -> some View {
		HStack(spacing: 5) { 
			Image(systemName: icon)
				.font(.largeTitle)
				.symbolRenderingMode(.multicolor)
				.foregroundStyle(.blue, .white)
			
			VStack(alignment: .leading, spacing: 1) {
				Text(title)
					.font(.callout)
					.foregroundColor(.primary)
				
				Text(subtitle)
					.font(.caption2)
					.foregroundColor(.primary)
					.opacity(0.7)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	var screenSize: CGSize = {
		guard let size = NSScreen.main?.visibleFrame.size else {
			return .zero
		}
		return size
	}()
	
}
