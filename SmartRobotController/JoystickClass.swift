//
//  JoystickClass.swift
//  SmartRobotController
//
//  Created by 高野大河 on 2022/03/23.
//

import Foundation
import SwiftUI

class JoystickValue : ObservableObject {
    @Published var XYControllerPower : Int = 0
    @Published var XYControllerDegree : Int = 0
    @Published var YControllerPower : Int = 0
}
