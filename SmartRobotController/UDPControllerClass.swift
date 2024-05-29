//
//  UDPControllerClass.swift
//  SmartRobotController
//
//  Created by 高野大河 on 2021/08/14.
//

import Foundation
import Network
import SwiftUI

class UDPController : ObservableObject{
    private var CONNECTION : NWConnection?
    @Published var IP : String = "ERROR"
    @Published var PORT : String = "65500"
    
    private let queueTwo = DispatchQueue(label: "TWO" , qos: .userInteractive, attributes: .concurrent)
    
    func send(item : String){
        let payload = item.data(using: .utf8)!
        if(self.IP != "ERROR" && self.PORT != ""){
            self.CONNECTION = NWConnection(host: NWEndpoint.Host(self.IP), port: .init(integerLiteral: UInt16(self.PORT)! ), using: .udp)
            self.CONNECTION!.start(queue: queueTwo)
            
            self.CONNECTION!.send(content: payload, completion: .contentProcessed({ sendError in
            }))
            Thread.sleep(forTimeInterval: 0.01)
            self.CONNECTION?.cancel()
        }
    }
    
    func CheckAddr(){
        let dispatchGroup = DispatchGroup()
        let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent)
        dispatchGroup.enter()
        dispatchQueue.async{
            
            let config = URLSessionConfiguration.default

            _ = URLSession(configuration: config)

            var urlComponents = URLComponents(string: "http://TaigaTakanoMacBookPro13.local:8000/")
            urlComponents?.query = "key=c18rks&name=\(UIDevice.current.name)"
            let url = urlComponents?.url

            do {
                let sourceHTML: String = try String(contentsOf: url!, encoding: String.Encoding.utf8);
                self.IP = sourceHTML

            }
            catch {
                print("Error");
                self.IP = "ERROR"
            }
            
            dispatchGroup.leave()
        }
    }
}
