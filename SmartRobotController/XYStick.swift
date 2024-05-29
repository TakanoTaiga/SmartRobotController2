//
//  XYStick.swift
//  SmartRobotController
//
//  Created by 高野大河 on 2021/08/22.
//

import SwiftUI

struct XYStick: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray.opacity(0.5))
            Circle()
                .frame(width: 115, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("White-D"))
        }
    }
}

struct XYStick_Previews: PreviewProvider {
    static var previews: some View {
        XYStick()
    }
}
