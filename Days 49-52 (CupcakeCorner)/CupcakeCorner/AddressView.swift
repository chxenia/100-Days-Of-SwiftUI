//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Xenia on 23.10.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: SharedOrder
    
    var body: some View {
        
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Adress", text: $order.streetAdress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
                
            }
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: SharedOrder())
    }
}
