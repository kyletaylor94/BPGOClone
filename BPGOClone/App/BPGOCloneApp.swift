//
//  BPGOCloneApp.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 04..
//

import SwiftUI
import Shake
import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Shake.start(apiKey: "dysgXArPDpZMvvetA5P03Xgx1sGyMTwCkA2kWJ3aZgFvo1v9P2o1wr7")
        Shake.configuration.isInvokedByShakeDeviceEvent = true
        Shake.configuration.isInvokedByScreenshot = true
        Shake.configuration.shakingThreshold = 400
        Shake.configuration.setShowIntroMessage = false
        
        Shake.configuration.form = SHKForm(items: [
            SHKPicker(key: "feedback_type", label: "Bejelentés típusa", items: [
                SHKPickerItem(key: "bug", text: "Hibabejelentés", icon: UIImage(systemName: "ant.circle"), tag: nil),
                SHKPickerItem(key: "suggestion", text: "Fejlesztési javaslat", icon: UIImage(systemName: "circle.badge.plus"), tag: nil),
                SHKPickerItem(key: "question", text: "Kérdés", icon: UIImage(systemName: "questionmark.square"), tag: nil)
            ]),
            SHKTextInput(key: "description", label: "Leírás", required: true, initialValue:nil),
            SHKEmail(key: "email", label: "Email", required: true, initialValue: nil),
            SHKAttachments()
            
        ])
        return true
    }
}

@main
struct BPGOCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            CustomTabView()
        }
    }
}
