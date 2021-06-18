//
//  ColorModel.swift
//  tutorial
//
//  Created by 강태진 on 2021/06/18.
//

import Foundation
import Combine
import SwiftUI

final class ColorModel : ObservableObject {
    @Published var color: Color = Color.white
    @Published var redV : CGFloat = 1.0
    @Published var greenV : CGFloat = 1.0
    @Published var blueV : CGFloat = 1.0
    
    func newColor() {
        color = Color(red: Double(redV), green: Double(greenV), blue: Double(blueV))
    }
    
    func reset() {
        redV = 0
        greenV = 0
        blueV = 0
        color = Color(red: Double(redV), green: Double(greenV), blue: Double(blueV))
    }
}
