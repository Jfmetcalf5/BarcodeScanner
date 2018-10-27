//
//  BarcodeDetailViewController.swift
//  BarcodeScanner
//
//  Created by Jacob Metcalf on 10/27/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class BarcodeDetailViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    var barcode: Barcode? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let barcode = barcode, isViewLoaded else { return }
        descriptionLabel.text = barcode.description
    }
    
}
