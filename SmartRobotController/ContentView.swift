import SwiftUI
import Combine
import Network


struct ContentView: View {
    @ObservedObject var UDPC = UDPController()
    @ObservedObject var JV = JoystickValue()
    
    @State var timer : Timer?
    @State var sendingTimer : Timer?
    @State var sendingTimer2 : Timer?
    
    @State var XYCP_his : Int = 0
    @State var XYCD_his : Int = 0
    @State var YCP_his : Int = 0
    
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
    var body: some View {
        ZStack{
            HStack{
                XYControllerView(JV: JV)
                    .padding(.leading, 50.0)
                Spacer()
            }
            
            HStack{
                Spacer()
                YControllerView(JV: JV)
                    .padding(.trailing, 50.0)
            }
            
            VStack{
                HStack{
                    if UDPC.IP == "ERROR" {
                        Image(systemName: "exclamationmark.icloud")
                            .foregroundColor(.red)
                            .padding(.all)
                            .font(.title2)
                    }else{
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                            .padding(.all)
                            .font(.title2)
                    }
                    
                    Text("\(version)")
                        .opacity(0.5)
                    
                    Text("TaigaTakanoMacBookPro13")
                        .opacity(0.5)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
        }
        .onAppear(){
            UDPC.CheckAddr()
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true){_ in
                UDPC.CheckAddr()
            }
            
            sendingTimer = Timer.scheduledTimer(withTimeInterval: 0.05 , repeats: true){_ in
                sendingData()
            }
            
            sendingTimer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                var rtString = ""
                rtString += "JVXYCP\(JV.XYControllerPower)END"
                rtString += "JVXYCD\(JV.XYControllerDegree)END"
                rtString += "JVYCP\(JV.YControllerPower)END"
                UDPC.send(item: rtString)
            }
            
        }
    }
    
    func sendingData(){
        var rtString = ""
        if XYCP_his != JV.XYControllerPower {
            rtString += "JVXYCP\(JV.XYControllerPower)END"
            XYCP_his = JV.XYControllerPower
        }
        
        if XYCD_his != JV.XYControllerDegree {
            rtString += "JVXYCD\(JV.XYControllerDegree)END"
            XYCD_his = JV.XYControllerDegree
        }
        
        if YCP_his != JV.YControllerPower {
            rtString += "JVYCP\(JV.YControllerPower)END"
            YCP_his = JV.YControllerPower
        }
        
        if rtString != "" {
            UDPC.send(item: rtString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
