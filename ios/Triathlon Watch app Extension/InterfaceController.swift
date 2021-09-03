//
//  InterfaceController.swift
//  Triathlon Watch app Extension
//
//  Created by Gioele on 02/09/21.
//

import WatchKit
import Foundation
import WatchConnectivity
import HealthKit

class InterfaceController: WKInterfaceController, WCSessionDelegate, HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        print("Ok1")
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        print("ok2")
    }
    
    
    func setupHealthkit() {
        do {
            
            let workoutStartDate = Date()
            
            let hkStore = HKHealthStore()
            let configuration = HKWorkoutConfiguration()
            configuration.activityType = .running
            configuration.locationType = .outdoor
            let workoutSession = try HKWorkoutSession(healthStore: hkStore, configuration: configuration)
            workoutSession.delegate = self
            
            workoutSession.startActivity(with: workoutStartDate)
            
            let distanceType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)
            let predicate = HKQuery.predicateForSamples(withStart: workoutStartDate, end: nil, options: [])
        
            let distanceQuery = HKAnchoredObjectQuery(type: distanceType!, predicate: predicate, anchor: HKQueryAnchor(fromValue: Int(UInt(HKAnchoredObjectQueryNoAnchor)))
, limit: 0) { (query, samples, deletedObjects, anchor, error) -> Void in
                
                print(query)

           // Handle when the query first returns results

           // TODO: do whatever you want with samples (note you are not on the main thread)

           }
            
            distanceQuery.updateHandler = { (query, samples, deletedObjects, anchor, error) -> Void in

                print(query)
                
           // Handle update notifications after the query has initially run

           // TODO: do whatever you want with samples (note you are not on the main thread)

           }
            
            hkStore.execute(distanceQuery)
        
        } catch {
            print("Whoops, something bad happened")
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        //Set the label to be the result of counter
        self.label.setText((message["data"] as? String) ?? "oh no")
        setupHealthkit()
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


/*

 class InterfaceController: WKInterfaceController, WCSessionDelegate, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate {
     
     
     func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
         /*for type in collectedTypes {
                 guard let quantityType = type as? HKQuantityType else {
                     return // Nothing to do.
                 }
                 
                 // Calculate statistics for the type.
                 let statistics = workoutBuilder.statistics(for: quantityType)
                 
                 print("Bho, something happened. I'm not sure what tho")
             }*/
     }
     
     func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
         //let lastEvent = workoutBuilder.workoutEvents.last
         print("Some other thing happened, i'm not sure what here too")
     }
     
     
     
     func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
         
     }
     
     func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
         
     }
     
     
     func setupHealthKit() {
         if(HKHealthStore.isHealthDataAvailable()) {
             let healthStore = HKHealthStore()
             
             let read: Set = [
                 HKQuantityType.quantityType(forIdentifier: .heartRate)!
             ]
             
             healthStore.requestAuthorization(toShare: nil, read: read) {
                 (success, error) in print(success ? "success" : error!)
             }
             
             let config = HKWorkoutConfiguration()
             config.activityType = .running
             config.locationType = .outdoor
             
             do {
                 let session = try HKWorkoutSession(healthStore: healthStore, configuration: config)
                 let builder = session.associatedWorkoutBuilder()
                 builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: config)
                 session.delegate = self
                 builder.delegate = self
                 
                 session.startActivity(with: Date())
                 builder.beginCollection(withStart: Date()) { (success, error) in
                     
                     guard success else {
                         // Handle errors.
                         print(error!)
                         return;
                     }
                     
                     print("Session has started")
                     
                     // Indicate that the session has started.
                 }
             } catch {
                 // Handle failure here.
                 return
             }
         }
     }
     
     func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
         
     }
     
     func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
         //Set the label to be the result of counter
         self.label.setText((message["data"] as? String) ?? "oh no")
         //setupHealthKit()
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

 
*/
