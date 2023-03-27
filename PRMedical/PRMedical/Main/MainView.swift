//
//  MainView.swift
//  PRMedical
//
//  Created by Harsh Yadav on 09/03/23.
//

import SwiftUI

struct MainView: View {
    @State private var currentTab:TabRoutingViews = .home
    
    var body: some View {
        NavigationStack{
            VStack{
                TabView(selection: $currentTab) {

                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag(TabRoutingViews.home)

                    
                    Text("Add Docs")
                        .tabItem {
                            Label("ADD", systemImage: "plus")
                        }
                        .tag(TabRoutingViews.addDoc)
                    
                    
                    PillsReminderView()
                        .tabItem {
                            Label("Pills", systemImage: "pills")
                        }
                        .tag(TabRoutingViews.pills)
                }
            }
            
            .toolbar {
                if(currentTab == .home){
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(value: HomeRoutingOptions.editPersonalDetails) {
                            Text("Edit")
                        }
                    }
                }
            }
            .toolbar{
                if(currentTab == .pills){
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(value: PillReminderRouteViews.addPill) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .onChange(of: currentTab, perform: { newValue in
                print(newValue)
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(currentTab.rawValue)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
