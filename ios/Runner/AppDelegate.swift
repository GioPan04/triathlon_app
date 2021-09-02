import UIKit
import Flutter
import WatchConnectivity

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    

    func sendString(text: String) {
        print(text)
        let session = WCSession.default
        
        if(session.isPaired && session.isReachable) {
            DispatchQueue.main.async {
                print("Sending data to watch")
                session.sendMessage(["data": text], replyHandler: nil, errorHandler: nil)
            }
        } else {
            print("Watch not reachable")
        }
    }
    

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
    
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let channel = FlutterMethodChannel(name: "it.gioelepannetto.triathlon_app/watch_channel", binaryMessenger: controller as! FlutterBinaryMessenger)
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            if(call.method == "sendString") {
                self.sendString(text: call.arguments as! String)
                result("Data from native: " + (call.arguments as! String))
            }
        })
        
        
        if(WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    
    
    
    
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
