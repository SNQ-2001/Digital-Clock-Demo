//
//  ContentView.swift
//  Digital-Clock-Combine
//
//  Created by 宮本大新 on 2022/11/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                Color(red: 132/255, green: 209/255, blue: 78/255).edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 10) {
                    Text("\(viewModel.time.formatted(.iso8601.year().month().day().dateSeparator(.dash)))")
                        .fontWeight(.medium)
                        .font(.custom("DSEG7Modern-BoldItalic", size: geo.size.width/15))
                        .foregroundColor(.black)
                        .background(
                            Text("8888-88-88")
                                .fontWeight(.medium)
                                .font(.custom("DSEG7Modern-BoldItalic", size: geo.size.width/15))
                                .foregroundColor(.black.opacity(0.1))
                        )
                    Text("\(viewModel.time.formatted(.iso8601.time(includingFractionalSeconds: false)))")
                        .fontWeight(.medium)
                        .font(.custom("DSEG7Modern-BoldItalic", size: geo.size.width/6))
                        .foregroundColor(.black)
                        .background(
                            Text("88:88:88")
                                .fontWeight(.medium)
                                .font(.custom("DSEG7Modern-BoldItalic", size: geo.size.width/6))
                                .foregroundColor(.black.opacity(0.1))
                        )
                }
            }
        }
        .onDisappear {
            viewModel.timer.upstream.connect().cancel()
        }
    }
}
