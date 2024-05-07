//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Paul Hudson on 10/11/2023.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Nome", text: $order.name)
                TextField("Endereço completo", text: $order.streetAddress)
                TextField("Cidade", text: $order.city)
                TextField("CEP", text: $order.zip)
            }
            
            Section {
                NavigationLink("Enviar pedido") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Detalhes do envio")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
