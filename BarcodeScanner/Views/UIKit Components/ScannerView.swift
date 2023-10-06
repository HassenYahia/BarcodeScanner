//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Hassen Abdurahman Yahia on 2023-10-05.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) ->  ScannerVC {
        ScannerVC(scannerDelagate: context.coordinator)
    }
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerview: self)
    }
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        init (scannerview: ScannerView){
            self.scannerView = scannerview
        }
        
         func didFind(barcode: String) {
             scannerView.scannedCode = barcode
        }
    
        func didSurface(error: CamerError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
       }
    }
    
}

/*struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("12345"), alertItem: .constant(value: AlertItem?))
    }
}*/

