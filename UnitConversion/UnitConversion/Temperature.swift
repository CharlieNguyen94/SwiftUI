//
//  Temperature.swift
//  UnitConversion
//
//  Created by Charlie Nguyen on 16/11/2020.
//

import Foundation

struct Temperature: UnitType {
    static var name = "Temperature"
    
    private static let celsius = NamedUnit(name: "Celsius", unit: UnitTemperature.celsius)
    private static let fahrenheit = NamedUnit(name: "Fahrenheit", unit: UnitTemperature.fahrenheit)
    private static let kelvin = NamedUnit(name: "Kelvin", unit: UnitTemperature.kelvin)
    
    static let units = [celsius, fahrenheit, kelvin]
}
