//
//  UIApplication + Additionals.swift
//  Effective_TestTask
//
//  Created by Arcani on 17.12.2022.
//

import UIKit

extension UIApplication {
    
   /// First responder resigns
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
