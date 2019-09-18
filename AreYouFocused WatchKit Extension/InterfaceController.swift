//
//  InterfaceController.swift
//  AreYouFocused WatchKit Extension
//
//  Created by Jordan Cowe on 2019-03-03.
//  Copyright © 2019 Jordan Cowe. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var notifyButton: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    @IBAction func setNotifications() {
        let center = UNUserNotificationCenter.current()
        let category = UNNotificationCategory(identifier: "focusedCategory", actions: [], intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
        center.requestAuthorization(options: [.alert, .sound]) { success, error in
            if success {
                center.removeAllPendingNotificationRequests()
                self.createNotifications()
            }
        }
        
    }
    
    @IBAction func notifyTap() {
        let center = UNUserNotificationCenter.current()
        let category = UNNotificationCategory(identifier: "focusedCategory", actions: [], intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
        let content = UNMutableNotificationContent()
        center.requestAuthorization(options: [.alert, .sound]) { success, error in
        if success {
            content.title = "Focus!"
            content.categoryIdentifier = "focusedCategory"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request) { (error) in
                if error != nil {
                    print(error!)
                    self.notifyButton.setTitle("Failed")
                } else {
                    print("Notifications Set")
                    self.notifyButton.setTitle("Success")
                }
            }
        } else {
            self.notifyButton.setTitle("Failed")
        }
        }
    }
    
    
    func createNotifications() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Focus!"
        content.categoryIdentifier = "focusedCategory"
        content.sound = UNNotificationSound.default
        
            for y in 9...22 {
                for z in 1...2 {
                    
                    var dateComponents = DateComponents()
                    dateComponents.calendar = Calendar.current
                    
                    dateComponents.hour = y
                    dateComponents.minute = Int.random(in: (5)...(25)) + (30 * z)
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    let identityString = "AreYouFocused." + String(y) + String(z)
                    let request = UNNotificationRequest(identifier: identityString, content: content, trigger: trigger)
                    center.add(request) { (error) in
                        if error != nil {
                            print(error!)
                        } else {
                        print("Notifications Set")
                        }
                    }
                
            }
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
