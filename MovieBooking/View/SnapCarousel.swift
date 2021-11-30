//
//  SnapCarousel.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 30/11/21.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index : Int
    
    init(spacing: CGFloat = 15, trailingSpace : CGFloat = 50, index : Binding<Int> , items: [T], @ViewBuilder content: @escaping (T)->Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
        
    }
    
    @GestureState var offset : CGFloat = 0
    @State var currentIdx : Int = 0
    
    var body: some View {
        GeometryReader{proxy in
            
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace/2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) {item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace, height: proxy.size.height)
                    
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIdx) * -width) + (currentIdx != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: {value, out, _ in
                        out = value.translation.width
                    }).onEnded({value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIdx = progress.rounded()
                        currentIdx = max(min(currentIdx + Int(roundIdx), list.count-1),0)
                        
                        currentIdx = index
                    })
                    .onChanged({value in
                        let offsetX = value.translation.width
                        let progress = -offsetX/width
                        let roundIdx = progress.rounded()
                        index = max(min(currentIdx + Int(roundIdx), list.count-1),0)

                    })
            )
            
            
        }.animation(.easeInOut, value: offset==0)
    }

}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
