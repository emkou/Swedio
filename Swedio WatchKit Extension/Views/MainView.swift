//
//  ContentView.swift
//  Swedio WatchKit Extension
//
//  Created by Emil Doychinov on 2020-03-27.
//  Copyright © 2020 Emil Doychinov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(alignment: .center) {
            List(DataSource.data, id: \.id) { item in
                RadioRowView(radioItem: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
