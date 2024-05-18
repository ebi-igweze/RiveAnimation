//
//  SignInView.swift
//  RiveAnimation
//
//  Created by ebi igweze on 09/05/2024.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    let subText = "Access to 240+ hours of content. Learn design and code by building apps in React and Swift."
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isLoading: Bool = false
    @Binding var showModal: Bool
    
    let checkAnimation = RiveViewModel(
        fileName: "check",
        stateMachineName: "State Machine 1"
    )
    
    let confettiAnimation = RiveViewModel(
        fileName: "confetti",
        stateMachineName: "State Machine 1"
    )
    
    func login() {
        isLoading = true
        if (email != "") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                checkAnimation.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                confettiAnimation.triggerInput("Trigger explosion")
            }
            // auto-dismiss
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    showModal = false
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                checkAnimation.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("Sign In")
                .customFont(.largeTitle)
            
            Text(subText)
                .customFont(.headline)
            
            EmailInput(email: $email)
        
            PasswordInput(password: $password)
            
            Button(
                action: {
                    login()
                },
                label: {
                    Label("Sign In", systemImage: "arrow.right")
                        .customFont(.headline)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "F77D8E"))
                        .foregroundStyle(.white)
                        .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                        .cornerRadius(8, corners: [.topLeft])
                    .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 10, x: 0, y: 10)
                })
            
            
            OrDivider()
            
            Text("Sign up with Email, Apple or Google")
                .customFont(.subheadline)
                .foregroundStyle(.secondary)
            
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
            .padding(.bottom, 10)
            
        }
        .padding(24)
        .background(.regularMaterial)
        .mask(
            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
        )
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                .stroke(.linearGradient(
                    colors: [.white.opacity(0.8),.white.opacity(0.1)],
                    startPoint: .topLeading, endPoint: .bottomTrailing)
                )
        )
        .padding()
        .overlay(
            ZStack {
                if isLoading {
                    checkAnimation.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                
                confettiAnimation.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
        
    }
}


struct EmailInput: View {
    @Binding var email: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Email")
                .customFont(.subheadline)
                .foregroundStyle(.secondary)
            
            TextField("", text: $email)
                .customTextField(icon: "Icon Email")
        }
    }
}

struct PasswordInput: View {
    @Binding var password: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Password")
                .customFont(.subheadline)
                .foregroundStyle(.secondary)
            
            SecureField("", text: $password)
                .customTextField(icon: "Icon Lock")
        }
    }
}

struct OrDivider: View {
    var body: some View {
        
        HStack {
            Rectangle().frame(height: 1).opacity(0.3)
            
            Text("OR")
                .customFont(.subheadline)
                .foregroundStyle(.secondary)
            
            Rectangle().frame(height: 1).opacity(0.3)
        
        }
    }
}

#Preview {
    SignInView(showModal: .constant(true))
}
