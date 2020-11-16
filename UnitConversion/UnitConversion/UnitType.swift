//
//  UnitType.swift
//  UnitConversion
//
//  Created by Charlie Nguyen on 16/11/2020.
//

import Foundation

// List of units of the same type
protocol UnitType {
    static var name: String { get }
    static var units: [NamedUnit] { get }
}
