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
            
            LazyVStack(spacing: 15,
                       pinnedViews: [.sectionFooters],
                       content: {
                Section(footer: FooterView()) {
//                    HStack {
//
//                        Button(action: {}, label: {
//                            Image(systemName: "chevron.left")
//                                .font(.title2)
//                        })
//                        Spacer()
//                        Button(action: {}, label: {
//                            Image(systemName: "bookmark")
//                                .font(.title2)
//                        })
//                    }
//                    .overlay(
//                        Text("Movie Detail")
//                            .font(.title2)
//                            .fontWeight(.semibold)
//                    )
//                    .padding()
//                    .foregroundColor(.white)
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white.opacity(0.2))
                            .padding(.horizontal)
                            .offset(y: 12)
                        Image("poster")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width/1.2, height: getRect().height/2, alignment: .center)
                            .cornerRadius(16)
                    }
                    .frame(width: getRect().width/1.5, height: getRect().height/2, alignment: .center)
                    .padding(.top, 20)
                    
                    
                    VStack(alignment: .leading, spacing: 15,
                           content: {
                        Text("Dunkirk")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
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
        }).background(Color("bg").ignoresSafeArea())
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
