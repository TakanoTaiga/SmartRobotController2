//
//  SettingMenu.swift
//  SmartRobotController
//
//  Created by 高野大河 on 2021/08/01.
//

import SwiftUI
import Network

struct SettingMenu: View {
    //@ObservedObject var networkMaster : networkInfo
    @State var ip = ""
    @State var port = ""
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            
            HStack {
                VStack (alignment : .leading){
                    Text("IPアドレス")
                        .padding()
                    TextField("192.168.0.20", text : $ip)
                        .keyboardType(.decimalPad)
                        .padding()
                    Button(action:{
                        //ip = networkMaster.targetIP
                    }){
                        Text("現在値")
                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                            .padding(.all)
                    }
                    Spacer()
                }
                Spacer()
                VStack (alignment : .leading) {
                    Text("ポート")
                        .padding()
                    TextField("65501" , text : $port)
                        .keyboardType(.decimalPad)
                        .padding()
                    Button(action:{
                        //port = String(networkMaster.targetPort)
                    }){
                        Text("現在値")
                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                            .padding(.all)
                    }
                    Spacer()
                }
                Spacer()
            }
            
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Button(action:{
                            endPoint()
                        }){
                            Image(systemName: "xmark.circle")
                                .padding(.all)
                        }
                        
                        Spacer()
                        
                        Button(action:{
                            //send(("Q").data(using: .utf8)!)
                        }){
                            Image(systemName: "power")
                                .padding(.all)
                        }
                    }
                    
                }
                Spacer()
            }
        }
    }
    
    func endPoint(){
        if (ip == "" || port == ""){
            NSLog("IP Error")
        }else{
            //networkMaster.isShowing = false
            //networkMaster.targetIP = ip
            //networkMaster.targetPort = UInt16(port)!
        }
    }
    
//    func send(_ payload: Data){
//        connect()
//        networkMaster.connection!.send(content: payload, completion: .contentProcessed({ sendError in
//
//        }))
//        Thread.sleep(forTimeInterval: 0.005)
//        networkMaster.connection?.cancel()
//    }
//
//    func connect(){
//        networkMaster.connection = NWConnection(host: .init(networkMaster.targetIP), port: .init(integerLiteral: networkMaster.targetPort), using: .udp)
//        networkMaster.connection!.start(queue: .global())
//    }
}

struct SettingMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingMenu()
    }
}


extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
