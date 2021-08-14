//
//  JSONDecoder.swift
//  Clima
//
//  Created by Umair Riaz on 13/08/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the Bundle.")
        }
        
        // 2. Create property for Data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data \(file) from the Bundle")
        }
        
        // 5. Return the ready-to-use data
        return decodedData
    }
}
