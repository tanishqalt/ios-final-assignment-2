//
//  Models.swift
//  BeerApp
//
//  Created by Tanishq Sharma on 2022-04-16.
//

import Foundation

struct BeerObject: Codable {
    let description: String
    let name: String?
    let tagline: String?
    let image_url: URL?
}
