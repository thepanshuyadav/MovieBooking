//
//  HomeView.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 12/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing:15) {
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Browse")
                        .font(.largeTitle)
                    Button(action: {
                        
                    }) {
                        HStack(spacing: 10) {
                            Text("Movies in New Delhi")
                            Image(systemName: "chevron.down").font(.body)
                        }
                    }
                }
                .foregroundColor(.white)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "filemenu.and.selection")
                        .resizable()
                        .frame(width: 25, height: 25)
                }.foregroundColor(.white)
            }
            .padding()

            SearchView().padding()
            
            HStack {
                Text("All Movies").fontWeight(.bold)
                Spacer()
                Button(action: {
                    
                }) {
                    HStack(spacing: 15) {
                        Text("Filter")
                        Image(systemName: "line.3.horizontal.decrease.circle").renderingMode(.original)
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(datas) {i in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                
                                ForEach(i.row) { j in
                                    NavigationLink(destination: MovieDetail(), label: {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Image(j.image)
                                                .resizable()
                                                .frame(width: 150, height: 225)
                                                .aspectRatio(contentMode: .fill)
                                                .cornerRadius(10)
                                                .shadow(color: .blue.opacity(0.5), radius: 5, x: 10, y: 10)
                                            
                                            
                                            Text(j.name).font(.body).lineLimit(1).padding(.leading, 5)
                                            Text(j.time).font(.caption).lineLimit(1).padding(.leading, 5)
                                            
                                        }
                                        .foregroundColor(.white)
                                        .padding(5)
                                    })
                                    
                                }
                            }
                        }
                        
                    }
                }.padding()
            }
            
        }
        .padding(.top, 40)
        .background(Color("bg"))
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct SearchView : View {
    @State var text = ""
    var body: some View {
        HStack(spacing : 15) {
            Image(systemName: "magnifyingglass")
                .font(.body)
            TextField("Search Movie", text: $text)
        }
        .padding(10)
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct type : Identifiable {
    var id: Int
    var row: [row]
}

struct row : Identifiable {
    var id : Int
    var name : String
    var time : String
    var image : String
}

struct datatype : Identifiable {
    var id : Int
    var date : String
    var day : String
}

var datas = [
    type(id: 0, row: [
        row(id: 0, name: "Dune", time: "2h 20m", image: "dune"),
        row(id: 1, name: "Nightingale", time: "2h 45m", image: "nightingale"),
        row(id: 2, name: "Venom", time: "2h 30m", image: "venom")
    ]),
    type(id: 1, row: [
        row(id: 0, name: "Wonder Woman", time: "3h 15m", image: "WonderWoman"),
        row(id: 1, name: "Spider Man", time: "2h 40m", image: "spiderman"),
        row(id: 2, name: "Suicide Squad", time: "3h 30m", image: "TheSuicideSquad"),
        row(id: 3, name: "Skyfall", time: "2h 30m", image: "skyfall")
    ]),
    type(id: 2, row: [
        row(id: 0, name: "Dunkirk", time: "3h 20m", image: "poster"),
        row(id: 1, name: "Souvenir", time: "3h 45m", image: "souvenir"),
        row(id: 2, name: "Parasite", time: "3h 20m", image: "parasite")
    ]),
    type(id: 3, row: [
        row(id: 0, name: "Joker", time: "3h 00m", image: "Joker"),
        row(id: 1, name: "Tumbbad", time: "2h 55m", image: "tumbbad"),
        row(id: 2, name: "1917", time: "2h 25m", image: "1917")
    ])
]
