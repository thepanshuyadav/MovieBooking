//
//  GenreView.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 30/11/21.
//

import SwiftUI

struct GenreView: View {
    var title: String
    
    init(title: String = "Genre") {
        self.title = title
    }

    var body: some View {
        ZStack {
            Image("logo")
                .resizable()
                .frame(width: 150, height: 225)
                .aspectRatio(contentMode: .fill)
                .blur(radius: 2)
                .cornerRadius(16)
            VStack {
                Text(self.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    
            }
            .multilineTextAlignment(.center)
        }
        .frame(width: 300, height: 225)
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(title: "Genre")
    }
}
