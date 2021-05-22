//
//  Combine.swift
//  Project20SwiftUIAndUIKit
//
//  Created by Janesh Suthar on 22/05/21.
//

import SwiftUI

struct CombineExampleView: View {
    @ObservedObject var companyInformation = CompanyInformation()
    
    var body: some View {
        Form {
            Text("CompantInfo updated -> \(companyInformation.compnayName!) \(companyInformation.companySize!)")
            UpdateInfo()
        }
        .environmentObject(companyInformation)
    }
}

struct UpdateInfo:View {
    
    @EnvironmentObject var companyInformation: CompanyInformation
    @State var presentNewView = false
    var body: some View {
        Button(action: {
            companyInformation.compnayName = "TCS"
            companyInformation.companySize = 200
        }, label: {
            Text("Update Info For TCS")
        })
        
        Button(action: {
            companyInformation.compnayName = "Infy"
            companyInformation.companySize = 100
        }, label: {
            Text("Update Info For InfY")
        })
        
        Button(action: {
            presentNewView = true
        }, label: {
            Text("Jump to nextViewController")
        }).sheet(isPresented: $presentNewView, onDismiss: nil, content: {
            DetailView()
        })
    }
}

struct DetailView:View {
    @EnvironmentObject var companyInformation: CompanyInformation
    var body:some View {
        Form {
            Text("CompantInfo updated -> \(companyInformation.compnayName!) \(companyInformation.companySize!)")
        }
    }
}

struct Combine_Previews: PreviewProvider {
    static var previews: some View {
        CombineExampleView()
    }
}

class CompanyInformation: ObservableObject {
    @Published var compnayName:String? = ""
    @Published var companySize:Int? = 0
}
