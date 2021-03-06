//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Charlie Nguyen on 29/06/2021.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type",
                           selection: $order.model.type) {
                        ForEach(0..<Order.Cupcake.types.count) {
                            Text(Order.Cupcake.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.model.quantity, in:
                                3...20) {
                        Text("Number of cakes: \(order.model.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.model.specialRequestEnabled.animation()) {
                        Text("Any Special requests?")
                    }
                    
                    if order.model.specialRequestEnabled {
                        Toggle(isOn: $order.model.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.model.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
