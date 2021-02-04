//
//  AppDelegate.swift
//  MovieReviewMac
//
//  Created by Akshay Anand on 25/07/20.
//  Copyright © 2020 Akshay Anand. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func application(_ application: NSApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([NSUserActivityRestoring]) -> Void) -> Bool {
        if let userDict = userActivity.userInfo {
            print(userDict)
        }
        if let window = NSApplication.shared.windows.first {
            window.contentViewController?.restoreUserActivityState( userActivity)
        }
        return true
    }
}

