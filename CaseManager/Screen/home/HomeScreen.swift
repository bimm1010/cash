    //
    //  HomeScreen.swift
    //  CaseManager
    //
    //  Created by Hoàng Nam on 17/4/25.
    //

import SwiftUI

struct HomeScreen: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                Text("Trang chủ")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .tabItem {
                Label("Nhập vào", systemImage: "pencil")
            }
            .tag(0)
            VStack {
                Text("Calendar")
                    .font(.title)
                    .foregroundColor(.green)
            }
            .tabItem {
                Label("Calender", systemImage: "calendar")
            }
            .tag(1)
            VStack {
                Text("Chart").fontWeight(.bold)
            }
            .tabItem {
                Label("Chart", systemImage: "chart.pie")
            }
            .tag(2)
            VStack {
                Text("Other").fontWeight(.bold).foregroundStyle(.red)
            }
            .tabItem {
                Label("Khác", systemImage: "ellipsis")
            }	
            .tag(3)
        }
        .tint(.green)
    }
}



#Preview {
    HomeScreen()
}
