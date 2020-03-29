//
//  Models.swift
//  SwiftUISample
//
//  Created by Vinicius Consulmagnos Romeiro on 29/03/20.
//  Copyright © 2020 Vinicius Consulmagnos Romeiro. All rights reserved.
//

import Foundation

struct Contry : Codable, Identifiable {
    let id = UUID()
    let name: String
}
