//
//  LineView.swift
//  Moonshot
//
//  Created by Xenia on 07.10.2023.
//

import SwiftUI

struct LineView: View {
    var isVertical: Bool
    var thickness: CGFloat
    var color: Color
    var ifPaddingVertical: Bool
    
    var body: some View {
        if isVertical {
            Rectangle()
                .frame(width: thickness)
                .foregroundColor(color)
                .padding(ifPaddingVertical ? .vertical : .horizontal)
        } else {
            Rectangle()
                .frame(height: thickness)
                .foregroundColor(color)
                .padding(ifPaddingVertical ? .vertical : .horizontal)
        }
    }
}


struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(isVertical: true, thickness: 2, color: .lightBackground, ifPaddingVertical: true)
    }
}
