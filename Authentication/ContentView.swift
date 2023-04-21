//
//  ContentView.swift
//  Authentication
//
//  Created by Lener Gonzalez on 21/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: login){
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
