//
//  LocalNotificationBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 21/11/2022.
//

import SwiftUI
import UserNotifications
import CoreLocation
class NotificationManger {
    static let instance = NotificationManger()
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) {
            (sucess, error) in
          if let error = error {
                print("Error ")
            } else {
                print("Sucess ")
            }
            
        }
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "this is my first notification"
        content.subtitle = "this was so easy!"
        content.sound = .default
        content.badge = 1
        //time
//let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        //clander
//        var dateComponents = DateComponents()
//        dateComponents.hour = 9
//        dateComponents.minute = 32
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //location
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        let trigger = UNLocationNotificationTrigger(region: region,
            repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permisson") {
                NotificationManger.instance.requestAuthorization()
            }
            Button("Schedule notification") {
                NotificationManger.instance.scheduleNotification()
            }

        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
