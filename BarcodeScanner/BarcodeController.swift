//
//  BarcodeController.swift
//  BarcodeScanner
//
//  Created by Jacob Metcalf on 10/27/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation

class BarcodeController {
    
    var barcode: Barcode = Barcode(description: "No Description")
    
    let baseURL = URL(string: "https://api.upcdatabase.org/product")!
    let apiKey = "7BAADF424FBB25BFCC844DA0B97EDD41"
    
    func fetchItem(withBarcode barcode: String, completion: @escaping (Error?) -> Void) {
        let url = baseURL.appendingPathComponent(barcode).appendingPathComponent(apiKey)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching barcodes: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("Error getting data from the fetch")
                completion(NSError())
                return
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                print(dictionary)
                if let barcode = Barcode(dictionary: dictionary) {
                    self.barcode = barcode
                    completion(nil)
                } else {
                    completion(error)
                }
            } catch {
                NSLog("Error decoding barcodes: \(error)")
                completion(error)
                return
            }
            }.resume()
    }
    
}
