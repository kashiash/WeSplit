//
//  ItemDetail.swift
//  WeSplit
//
//  Created by Jacek on 18/06/2022.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    @State private var showingOrderAlert = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
                   Text(item.description)
                .padding()
            
            Button("Order This"){
                order.add(item: item)
                showingOrderAlert.toggle()
            }
            .font(.largeTitle)
            .font(.headline)
            .padding()
           
            
 
            
            Spacer()
               }
               .navigationTitle(item.name)
               .navigationBarTitleDisplayMode(.inline)
               .alert(isPresented: $showingOrderAlert) {
                   Alert(title: Text("Order confirmed"), message:
                            Text("You order \n\(item.name)  \n$\(item.price)\n thank you!")
                         , dismissButton: .default(Text("OK")))
               }
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
          }
    }
}
