//
//  ImplicitAnimationsView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct ImplicitAnimationsView: View {
    
    // MARK: Stored properties
    
    // Controls what example is showing in the pop-up sheet
    @State private var showExampleOne = false
    @State private var showExampleTwo = false
    @State private var showExampleThree = false

    // MARK: Computed properties
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    // Example 1
                    // Animating state change for size
                    Group {

                        Text("Example 1")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            Implicit animations are as easy as it gets. We simply tell SwiftUI to animate any changes in state for a given view. And it is done – we don't have to do anything to specify how it happens, or consider what any of the "in-between" animation frames look like.

                            In this example, a button changes size when it is pressed. Try it out. Then try uncommenting the .animation view modifier on line 47.
                            """)
                        
                        Button("Show Example 1") {
                            showExampleOne = true
                        }
                        .sheet(isPresented: $showExampleOne) {
                            IAExampleOneView(showThisView: $showExampleOne)
                        }

                    }

                    // Example 2
                    // Animating state change for size and color
                    Group {
                        Text("Example 2")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            The key thing to understand with implicit animations is that all state changes that impact the view are animated.

                            In this example, the button still changes size when it is pressed. However, when it gets very small, and expands again, the hue changes to a new random value. Try it out. Then try uncommenting the .animation view modifier on line 54. Note how both state changes are animated when the button grows again.

                            This example also demonstrates that the length of the animation can be controlled, too. Notice the animation type has been changed from .default to .linear with a duration of 2.5 seconds.

                            One super cool feature of animations in SwiftUI is that they are interruptable. Try hammering on the circle with your trackpad – you will notice that a new animation to the new state begins, overriding the existing one. In essence, you can speed up the transition to a smaller circle.
                            """)
                        
                        Button("Show Example 2") {
                            showExampleTwo = true
                        }
                        .sheet(isPresented: $showExampleTwo) {
                            IAExampleTwoView(showThisView: $showExampleTwo)
                        }

                        
                    }
                    
                    // Example 3
                    // Animating state change for font face
                    Group {
                        Text("Example 3")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            Some state changes are not animatable. For example, changing the type face, or font, cannot be animated.

                            Try out this example. Notice how changes in type face result in the frame – the bounding box of the text view – animating it's change in size. However, the letters of the view don't change in shape from one typeface to the next.

                            It be nice to only animate specific changes in state – that is, only for certain properties – and this is what explicit animations are for.
                            """)
                        
                        Button("Show Example 3") {
                            showExampleThree = true
                        }
                        .sheet(isPresented: $showExampleThree) {
                            IAExampleThreeView(showThisView: $showExampleThree)
                        }

                        
                    }


                }
                .padding(.bottom)

            }

        }
        .padding()
        .navigationTitle("Implicit Animations")

    }
}

struct ImplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImplicitAnimationsView()
        }
    }
}
