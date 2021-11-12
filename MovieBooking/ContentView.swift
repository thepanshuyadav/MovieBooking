//
//  ContentView.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MovieDetail()
                .navigationBarHidden(false)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Movie Details")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
