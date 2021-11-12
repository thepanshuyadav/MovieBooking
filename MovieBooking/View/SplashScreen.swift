//
//  SplashScreen.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 12/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreen: View {
    @State var removeGif : Bool = false
    var body: some View {
        ZStack {
            ContentView()
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                if !removeGif {
                    AnimatedImage(url: getLogoURL())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
     
            }.opacity(removeGif ? 0 : 1)
        }

        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.7)) {
                    removeGif = true
                }
            }
        }
        
    }
    func getLogoURL () -> URL {
        let bundle = Bundle.main.path(forResource: "logo", ofType: "gif")
        let  url = URL(fileURLWithPath: bundle ?? "")
        return url
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
