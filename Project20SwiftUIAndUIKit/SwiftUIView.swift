//
//  SwiftUIView.swift
//  Project20SwiftUIAndUIKit
//
//  Created by Janesh Suthar on 22/05/21.
//

import SwiftUI
import UIKit

struct SwiftUIView: View {
    
    @ObservedObject var delegate = ContactPickerDelegate()
    @State private var presented = false
    @State private var isLoading = true
    @State private var rollNumber:Int? = 0
    
    var body: some View {
        
        Form {
            
            Text("This is swiftUI View & dynamic value is-->\n \(self.delegate.contact!)\n \(delegate.designation)" )
            
            Button(action: {
                presented = true
            }, label: {
                Text("Click to Open UIKit \(rollNumber ?? 0)" )
            })
            
            Button(action: {
                isLoading.toggle()
            }, label: {
                Text(isLoading ? "Stop" : "Start")
            })
            LoadingView(isAnimating: $isLoading)
            
            
        }.sheet(isPresented: $presented, content: {
            InfoWrapper(selectedIntegerValue: $rollNumber)
        })
        
    }
}

struct LoadingView : View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        ActivityIndicator(isAnimating: isAnimating)
    }
}

struct InfoWrapper: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    @Binding var selectedIntegerValue:Int?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> InfoViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        return vc
    }
    
    func updateUIViewController(_ uiViewController: InfoViewController, context: Context) {
        print(#function)
        uiViewController.changeRollNumerButton.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didTapRollNumber),
            for: .touchUpInside)
    }
    
    class Coordinator: NSObject {
        
        var parent:InfoWrapper
        
        @Environment(\.presentationMode) var presentationMode
        
        init(_ parent:InfoWrapper) {
            self.parent = parent
        }
        @objc func dismissControllerOnButtonTap() {
            presentationMode.wrappedValue.dismiss()
        }
        //This will call when you invoke some delegate
        @objc func didTapRollNumber() {
            parent.selectedIntegerValue = 100
        }
    }
}
struct ActivityIndicator: UIViewRepresentable {
    var isAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let v = UIActivityIndicatorView()
        
        return v
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
