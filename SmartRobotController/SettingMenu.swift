//
//  SettingMenu.swift
//  SmartRobotController
//
//  Created by 高野大河 on 2021/08/01.
//

import SwiftUI

struct SettingMenu: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .padding(.all)
                }
                Spacer()
            }
        }
    }
}

struct SettingMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingMenu()
    }
}
