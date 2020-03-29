//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Vinicius Consulmagnos Romeiro on 29/03/20.
//  Copyright © 2020 Vinicius Consulmagnos Romeiro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var list: [Contry] = []
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $name)
                    Button(action: {                        NetworkManager().fetchContries(withName: self.name, completionHandler: { (result) in
                        self.list = result
                        })
                    }) {
                        Text("Serach")
                    }
                }.padding(20)
                List(list) { contry in
                    Text(contry.name)
                }.navigationBarTitle("Countries")
            }
        }.onAppear(perform: {
            NetworkManager().fetchContries(completionHandler: { (result) in
                self.list = result
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
    
    
}
