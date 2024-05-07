//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Paul Hudson on 09/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    //@State private var quantity = 3
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Selecione o sabor", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Quantidade de cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Acrescentar algo?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Adicionar cobertura", isOn: $order.extraFrosting)
                        
                        Toggle("Adicionar granulado", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Detalhes para envio") {
                        AddressView(order: order)
                        
                    }
                }
            }
            .navigationTitle("Café com Cupcake")
        }
    }
}

#Preview {
    ContentView()
}
