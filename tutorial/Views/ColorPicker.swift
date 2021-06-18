//
//  ColorPicker.swift
//  tutorial
//
//  Created by 강태진 on 2021/06/18.
//

import SwiftUI

struct ColorPicker: View {
    @StateObject private var colorModel = ColorModel()
    @State private var isRed = true
    @State private var isGreen = true
    @State private var isBlue = true
    
    var body: some View {
        VStack.init(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Rectangle()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(colorModel.color);
            ColorSetting(
                isEditable: $isRed, colorV: $colorModel.redV).environmentObject(colorModel)
            ColorSetting(
                isEditable: $isGreen, colorV: $colorModel.greenV).environmentObject(colorModel)
            ColorSetting(
                isEditable: $isBlue, colorV: $colorModel.blueV).environmentObject(colorModel)
        })
    }

}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker().environmentObject(ColorModel())
    }
}

struct ColorSetting: View {
    @EnvironmentObject var colorModel : ColorModel
    @Binding var isEditable: Bool
    @Binding var colorV: CGFloat
    
    var body: some View {
        HStack {
            Toggle.init(isOn: $isEditable, label: {
            }).onChange(of: isEditable, perform: { value in
                colorV = value ? 1.0 : 0.0
            })
            Slider(
                value: $colorV,
                in: 0...1,
                step: 0.1,
                onEditingChanged: {_ in
                }
            ).onChange(of: colorV, perform: { value in
                colorV = value
                colorModel.newColor()
            })
        }
    }
}
