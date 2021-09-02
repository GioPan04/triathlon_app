//
//  InterfaceController.swift
//  Triathlon Watch app Extension
//
//  Created by Gioele on 02/09/21.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        //Set the label to be the result of counter
        self.label.setText((message["data"] as? String) ?? "oh no")
    }

    @IBOutlet weak var label: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        if(WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        label.setText("")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
