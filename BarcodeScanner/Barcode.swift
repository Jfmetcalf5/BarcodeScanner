//
//  Barcode.swift
//  BarcodeScanner
//
//  Created by Jacob Metcalf on 10/27/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation

struct Barcode: Decodable {
    
    var description: String
    
    init(description: String) {
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case description
    }
    
    init?(dictionary: [String: Any]) {
        guard let description = dictionary["description"] as? String else { return nil }
        self.description = description
    }
    
}
