//
//  ContentView.swift
//  Learning App
//
//  Created by Arthur Sh on 08.09.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject  var model:ContentModel
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading){
                
                Text("What do you want to do today ?")
                    .padding(.leading, 20)
                
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(model.modules){module in
                            
                            VStack(spacing: 20){
                                
                                NavigationLink {
                                    ContentView()
                                        .onAppear {
                                            model.beginModule(module.id)
                                        }
                                } label: {
                                    
                                    //Learning card
                                    
                                    HomeViewRow(image: module.content.image, title: "Learning \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }

                            
                           
                            
                            //Test card
                            
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            
                                
                            }
                            
                        }
                        
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                
            }
            .navigationTitle("Get Started")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
