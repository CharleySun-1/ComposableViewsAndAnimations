//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls the hue of the text
    @State private var hue: Color = .red
    
    // Controls the size of the text
    @State private var size: Double = 30.0
    
    // MARK: Computed properties
    
    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text(typeFace)
                    .font(.custom(typeFace, size: CGFloat (size)))
                    .border(Color.blue, width: 1.0)
                    .onTapGesture {
                        
                        size = Double.random(in: 30...80) / 80.0;
                        
                        hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                   saturation: 0.8,
                                   brightness: 0.8)
                        
                        }
                    // When useAnimation is true, the default animation effect will be used.
                    // When useAnimation is false, there will be no animation.
                    .animation(.default)
                
            }
            .navigationTitle("Exercise 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }
            
        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOneView(showThisView: .constant(true))
    }
}
