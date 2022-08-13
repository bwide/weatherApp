//
//  
//  HomeView.swift
//  TEMPLATE
//
//  Created by Bruno Wide on 06/03/22.
//
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View {

    @StateObject var vm: HomeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            Color.ds.primaryBackground
            Text(vm.title)
        }
        .onAppear { vm.onAppear.send() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
