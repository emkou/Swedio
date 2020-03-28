//
//  RadioRowView.swift
//  Swedio WatchKit Extension
//
//  Created by Emil Doychinov on 2020-03-27.
//  Copyright © 2020 Emil Doychinov. All rights reserved.
//

import Foundation
import SwiftUI

struct RadioRowView: View {
    
    var radioItem: RadioItem
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: DetailsView(radioItem: radioItem)) {
                     Text(radioItem.name)
                         .multilineTextAlignment(.center)
                        .padding(.all, 8.0)
                }
                Spacer()
            }
        }
    }
}

struct RadioRowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RadioRowView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
              RadioRowView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
              RadioRowView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
              RadioRowView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
              RadioRowView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
              RadioRowView(radioItem: RadioItem(id: "", name: "Bandit", url: ""))
        }
  
    }
}
