//
//  Home.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 12/11/21.
//

import SwiftUI

struct MovieDetail: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            LazyVStack(spacing: 10,
                       pinnedViews: [.sectionFooters],
                       content: {
                Section(footer: FooterView()) {
                    
                    
                    ZStack {
                        Image("poster")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width/1.1, height: getRect().height/1.6, alignment: .center)
                            .cornerRadius(16)
                    }
                    .padding(.top, 10)
                    .shadow(color: .orange.opacity(0.5), radius: 10, x: 10, y: 10)
                    
                    
                    VStack(alignment: .leading, spacing: 10,
                           content: {
//                        Text("Dunkirk")
//                            .font(.title2)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
                        
                        Text("Director : Christopher  Nolan |  4")
                            .foregroundColor(.white)
                            .overlay(
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .offset(x : 30, y : -1)
                                , alignment: .trailing
                            )
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], alignment: .leading, content: {
                            ForEach(genre, id: \.self) { genreName in
                                Text(genreName)
                                    .font(.caption)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .background(Color.white.opacity(0.1))
                                    .clipShape(Capsule())
                            }
                            
                        }).padding(.top)
                        
                        Text("Synopsis")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                        Text(synopsis)
                            .foregroundColor(.white)
                        
                        
                    })
                        .padding(.top, 50)
                        .padding(.horizontal)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            })
        })
            .background(Color("bg").ignoresSafeArea())
            .navigationBarTitle("Dunkirk")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail()
    }
}

struct FooterView : View {
    var body: some View {
        NavigationLink(destination: BookingView(), label: {
            Text("Book Tickets")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: getRect().width / 2)
                .background(Color.green)
                .cornerRadius(16)
        })
            .shadow(color: Color.green.opacity(0.4), radius: 5, x: 5, y: 5)
    }
}

extension View {
    func getRect () -> CGRect {
        return UIScreen.main.bounds
    }
}
