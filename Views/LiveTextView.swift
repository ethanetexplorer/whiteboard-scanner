//
//  LiveTextView.swift
//  whiteboard-scanner
//
//  Created by Alina Fu on 27/11/65 BE.
//
import Foundation
import SwiftUI
import VisionKit
import UIKit

@MainActor
struct LiveTextView: UIViewRepresentable {
     
    var imageName: String
    let imageView = LiveTextImageView()
    let analyzer = ImageAnalyzer()
    let interaction = ImageAnalysisInteraction()
    
    func makeUIView(context: Context) -> some UIView {
        imageView.image = UIImage(named: imageName)
        imageView.addInteraction(interaction)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let image = imageView.image else { return }
        Task { @MainActor in
            let configuration = ImageAnalyzer.Configuration([.text, .machineReadableCode])
            do {
                let analysis = try await analyzer.analyze(image, configuration: configuration)
                interaction.analysis = analysis
                interaction.preferredInteractionTypes = .automatic
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

class LiveTextImageView: UIImageView {
    
    override var intrinsicContentSize: CGSize {
        .zero
    }
    
}

