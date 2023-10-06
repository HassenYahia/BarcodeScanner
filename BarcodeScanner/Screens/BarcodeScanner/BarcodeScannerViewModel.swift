//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Hassen Abdurahman Yahia on 2023-10-06.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
}
