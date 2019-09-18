//
//  focusedNotificationController.swift
//  AreYouFocused WatchKit Extension
//
//  Created by Jordan Cowe on 2019-03-03.
//  Copyright © 2019 Jordan Cowe. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


class focusedNotificationController: WKUserNotificationInterfaceController {
    @IBOutlet weak var yesButton: WKInterfaceButton!
    @IBOutlet weak var noButton: WKInterfaceButton!
    @IBOutlet weak var thanksButton: WKInterfaceButton!
    @IBOutlet weak var alertLabel: WKInterfaceLabel!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }
    @IBAction func yesTapped() {
        WKInterfaceDevice.current().play(.success)
        alertLabel.setText("Great Job! \n Way to Go! \n 😁")
        yesButton.setHidden(true)
        noButton.setHidden(true)
        thanksButton.setHidden(false)
        
    }
    
    @IBAction func thanksTapped() {
        WKInterfaceDevice.current().play(.success)
        performDismissAction()
    }
    
    @IBAction func noTapped() {
        performDismissAction()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {

    }
    
}
