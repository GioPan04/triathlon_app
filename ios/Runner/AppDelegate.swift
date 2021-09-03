import UIKit
import Flutter
import WatchConnectivity
import HealthKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, WCSessionDelegate {
    
    let healthStore = HKHealthStore()
    
    
    func pleaseWork() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
                
                if (HKHealthStore.isHealthDataAvailable()){
                    self.healthStore.requestAuthorization(toShare: nil, read:[heartRateType], completion:{(success, error) in
                        let sortByTime = NSSortDescriptor(key:HKSampleSortIdentifierEndDate, ascending:false)

                        let query = HKSampleQuery(sampleType:heartRateType, predicate:nil, limit:600, sortDescriptors:[sortByTime], resultsHandler:{(query, results, error) in
                            guard let results = results else { return }
                            for quantitySample in results {
                                let quantity = (quantitySample as! HKQuantitySample).quantity
                                let heartRateUnit = HKUnit(from: "count/min")
                                
        //                        csvString.extend("\(quantity.doubleValueForUnit(heartRateUnit)),\(timeFormatter.stringFromDate(quantitySample.startDate)),\(dateFormatter.stringFromDate(quantitySample.startDate))\n")
        //                        println("\(quantity.doubleValueForUnit(heartRateUnit)),\(timeFormatter.stringFromDate(quantitySample.startDate)),\(dateFormatter.stringFromDate(quantitySample.startDate))")
                                print(quantity.doubleValue(for: heartRateUnit))                            }
                            
                        })
                        self.healthStore.execute(query)
                    })
                }
    }
    
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
                self.pleaseWork()
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
