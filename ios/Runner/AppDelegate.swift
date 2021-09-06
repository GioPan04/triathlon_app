import UIKit
import Flutter
import WatchConnectivity

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, WCSessionDelegate {
    
    private var channel: FlutterMethodChannel!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("State of session: \(activationState.rawValue)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Inactive session")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("Deactivate session")
    }
    
    func sendString(text: String) {
        print(text)
        let session = WCSession.default
    
        if(session.isPaired && session.isReachable) {
            DispatchQueue.main.async {
                print("Sending data to watch")
                session.sendMessage(["data": text], replyHandler: nil, errorHandler: { error in
                    print("\(error)")
                    self.channel.invokeMethod("WatchKitError", arguments: error.localizedDescription)
                })
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
        
        channel = FlutterMethodChannel(name: "it.gioelepannetto.triathlon_app/watch_channel", binaryMessenger: controller as! FlutterBinaryMessenger)
        
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
