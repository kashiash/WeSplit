//
//  OrderView.swift
//  WeSplit
//
//  Created by Jacek on 18/06/2022.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section {
                    NavigationLink(destination:
                                    Text("Check Out")) {
                        Text("Place Order")
                    }
                }
            }
        }
        .navigationTitle("Order")
        .listStyle(InsetGroupedListStyle())
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
