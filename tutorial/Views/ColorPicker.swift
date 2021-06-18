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
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Rectangle()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(colorModel.color)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                .cornerRadius(5.0)
            ColorSetting(
                title: "Red", accentColor: .red, isEditable: $isRed, colorV: $colorModel.redV).environmentObject(colorModel)
            ColorSetting(
                title: "Green",accentColor: .green, isEditable: $isGreen, colorV: $colorModel.greenV).environmentObject(colorModel)
            ColorSetting(
                title: "Blue", accentColor: .blue, isEditable: $isBlue, colorV: $colorModel.blueV).environmentObject(colorModel)
            Divider()
            Button(action:{ colorModel.reset() }) {
                Text("Reset")
            }
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
    var title: String
    var accentColor: Color
    @Binding var isEditable: Bool
    @Binding var colorV: CGFloat
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            Toggle(isOn: $isEditable, label: {
                Text(title)
                    .frame(width: 100.0)
                Slider(
                    value: $colorV,
                    in: 0...1,
                    step: 0.01,
                    onEditingChanged: {_ in
                    }
                ).onChange(of: colorV, perform: { value in
                    colorV = value
                    colorModel.newColor()
                }).disabled(!isEditable).accentColor(accentColor)
            }).onChange(of: isEditable, perform: { value in
            })
        })
    }
}
