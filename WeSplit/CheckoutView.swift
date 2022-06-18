//
//  CheckoutView.swift
//  WeSplit
//
//  Created by Jacek on 18/06/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var pickupType = "Rano"
    @State private var showingPaymentAlert = false
    let tipAmounts = [10, 15, 20, 25, 0]
    let pickupTypes = ["Rano", "W samo południe", "Wieczorem", "Nocne żery"]
    
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    let paymentTypes = ["Cash","Credit Card","Żryj z hasioka Points"]
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add Żryj z hasioka loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your Żryj z hasioka ID", text: $loyaltyNumber)
                }
                Section(header: Text("Pickup time")) {
                    Picker("Part of day:", selection: $pickupType) {
                        ForEach(pickupTypes, id: \.self) {
                            Text("\($0)")
                        }
                    }
                   // .pickerStyle(.wheel) //segmented, wheel,
                }
                
                Section(header: Text("Add a tip?")) {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header:
                    Text("TOTAL: \(totalPrice)")
                            .font(.largeTitle)
                   
                ) {
                    Button("Confirm order") {
                        showingPaymentAlert.toggle()
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))
            
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
