//
//  InfoView.swift
//  Slot Machine
//
//  Created by Jaime Uribe on 15/12/20.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form{
                Section(header: Text("About the application")){
                    FormRowView(firstItem: "Application", secoundItem: "Slot Machine")
                    FormRowView(firstItem: "Plataform", secoundItem: "iPhone, iPad, mac")
                    FormRowView(firstItem: "Developer", secoundItem: "Jaime Uribe")
                    FormRowView(firstItem: "Designer", secoundItem: "Robert Petras")
                    FormRowView(firstItem: "Website", secoundItem: "www.udemy.com")
                    FormRowView(firstItem: "Copyright ", secoundItem: "@ 2020 al right reserved.")
                    FormRowView(firstItem: "Version", secoundItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding(.top, 20)
            .padding(.trailing, 20)
            .accentColor(Color.secondary)
            , alignment: .topTrailing
        )
    }
}

struct FormRowView: View {
    
    var firstItem: String
    var secoundItem: String
    
    var body: some View {
        HStack{
            Text(firstItem).foregroundColor(Color.gray)
            Spacer()
            Text(secoundItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


