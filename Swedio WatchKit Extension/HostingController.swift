//
//  HostingController.swift
//  Swedio WatchKit Extension
//
//  Created by Emil Doychinov on 2020-03-27.
//  Copyright © 2020 Emil Doychinov. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<MainView> {
    override var body: MainView {
        return MainView()
    }
}
