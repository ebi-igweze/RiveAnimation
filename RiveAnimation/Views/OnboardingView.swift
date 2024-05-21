//
//  OnboardingView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 02/05/2024.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    let subText = "Don't skip design. Learn design and code by building apps in React and Swift. Complete courses about the best tools."
    
    let purchaseFootNote = "Purchase inclues 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."
    
    @State var showModal: Bool = false
    @Binding var showOnBoarding: Bool
    
    var body: some View {
        ZStack {
            
            bodyBackground
           
            content.offset(y: showModal ? -50.0 : 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.6 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView(showModal: $showModal)
                    .transition(
                        .move(edge: .top)
                        .combined(with: .opacity)
                    )
                    .overlay(
                        Button(action: {
                            withAnimation(.spring) {
                                showModal = false
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .background(.white)
                                .foregroundColor(.black)
                                .mask(Circle())
                                .shadow(
                                    color: Color("Shadow").opacity(0.3),
                                    radius: 5,
                                    x: 0,
                                    y: 3
                                )
                        })
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1.0)
            }
            
            Button(
                action: {
                    withAnimation(.spring) {
                        showOnBoarding = false
                    }
                },
                label: {
                    Image(systemName: "xmark")
                        .frame(width: 36, height: 36)
                        .background(.black)
                        .foregroundColor(.white)
                        .mask(Circle())
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            .offset(y: 80)
            
            
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn design & code")
                .font(.custom("Poppins Bold",size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            
            Text(subText)
                .customFont(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.8)
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label(
                        "Start the course",
                        systemImage: "arrow.forward"
                    )
                    .offset(x: 4, y: 4)
                    .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring) {
                            showModal = true
                        }
                    }
                }
            
            Text(purchaseFootNote)
                .customFont(.footnote)
                .opacity(0.8)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
    var bodyBackground: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 15)
            .background(
                Image("Spline")
                    .blur(radius: 15)
                    .offset(x: 100, y: 100)
            )
    }
}

#Preview {
    OnboardingView(showOnBoarding: .constant(true))
}
