//
//  BookingView.swift
//  MovieBooking
//
//  Created by Deepanshu Yadav on 12/11/21.
//

import SwiftUI

struct BookingView: View {
    @State var bookedSeats : [Int] = [1, 10, 11, 22, 25, 30, 45, 60]
    @State var selectedSeats : [Int] = []
    @State var date : Date  = Date()
    
    @State var selectedTime = "11:40"
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            GeometryReader { reader in
                let width = reader.frame(in: .global).width
                
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 50))
                    path.addCurve(
                        to: CGPoint(x: width, y: 50),
                        control1: CGPoint(x: width / 2, y: 0),
                        control2: CGPoint(x: width / 2, y: 0)
                    )
                    
                }
                .stroke(Color.gray, lineWidth: 2)
            }
            .frame(height: 50)
            .padding(.vertical)
            .padding(.horizontal)
            
            let totalSeats = 60 +  4
            let leftSide = 0..<totalSeats/2
            let rightSide = totalSeats/2..<totalSeats
            
            HStack(spacing: 30) {
                let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
                LazyVGrid(columns: columns, spacing: 12, content: {
                    
                    ForEach(leftSide, id: \.self) {index in
                        let seatIndex = index >= 29 ? index-1 : index
                        SeatView(index: index, seat: seatIndex, selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if(selectedSeats.contains(seatIndex)) {
                                    selectedSeats.removeAll { (removeSeat) -> Bool in
                                        return removeSeat == seatIndex
                                    }
                                    return
                                }
                                selectedSeats.append(seatIndex)
                            }
                            .disabled(bookedSeats.contains(seatIndex))
                    }
                })
                LazyVGrid(columns: columns, spacing: 12, content: {
                    ForEach(rightSide, id: \.self) {index in
                        let seatIndex = index >= 35 ? index-2 : index-1
                        SeatView(index: index, seat: seatIndex, selectedSeats: $selectedSeats, bookedSeats: $bookedSeats)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if(selectedSeats.contains(seatIndex)) {
                                    selectedSeats.removeAll { (removeSeat) -> Bool in
                                        return removeSeat == seatIndex
                                    }
                                    return
                                }
                                selectedSeats.append(seatIndex)
                            }
                            .disabled(bookedSeats.contains(seatIndex))
                    }
                })
            }.padding()
            
            HStack(spacing: 15) {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.caption)
                            .foregroundColor(.gray)
                    )
                Text("Booked")
                    .font(.caption)
                    .foregroundColor(Color("text"))
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 20, height: 20)

                Text("Available")
                    .font(.caption)
                    .foregroundColor(Color("text"))
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                Text("Selected")
                    .font(.caption)
                    .foregroundColor(Color("text"))
            }.padding(.top)
            
            HStack {
                Text("Date : ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("text"))
                Spacer()
                DatePicker("", selection: $date, displayedComponents: .date)
                    .labelsHidden()
                    .background(Color.gray)
                    .cornerRadius(16)
            }
            .padding()
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 15){
                    ForEach(time, id: \.self) { timing in
                        Text(timing)
                            .fontWeight(.bold)
                            .foregroundColor(Color("text"))
                            .padding()
                            .background(Color.blue.opacity(selectedTime == timing ? 1 : 0.4))
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedTime = timing
                            }
                        
                    }
                }.padding(.horizontal)
            })
            
            HStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("\(selectedSeats.count) Seats")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color("text"))
                    
                    Text("Rs \(selectedSeats.count * 250)")
                        .font(.title2)
                        .foregroundColor(.yellow)
                        
                })
                    .frame(width: 100)
                Button(action: {}, label: {
                    Text("Buy Tickets")
                        .foregroundColor(Color("text"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(selectedSeats.count == 0 ? Color.gray : Color.green)
                        .cornerRadius(15)
                        
                }).disabled(selectedSeats.count == 0)
            }
            .padding()
            
        })
            .background(Color("bg").ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Select Seats")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("text"))
                    }
                }
            }
        
    }
}

struct SeatView: View {
    var index : Int
    var seat: Int
    @Binding var selectedSeats : [Int]
    @Binding var bookedSeats : [Int]
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(bookedSeats.contains(seat) ? Color.gray : Color.blue.opacity(0.8), lineWidth: 2)
                .frame(height: 30)
                .background(
                    selectedSeats.contains(seat) ? Color.blue : Color.clear
                )
                .opacity(index == 0 || index == 28 || index == 35 || index == 63 ? 0 : 1)
            if(bookedSeats.contains(seat)) {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
        }
        
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
