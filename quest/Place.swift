//
//  Place.swift
//  quest
//
//  Created by Pavel Oleinic on 5/6/19.
//  Copyright © 2019 Pavel Oleinic. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject {
    var placeID: NSString = ""
    var name: NSString = ""
    var mission: NSString = ""
    var code: NSString = ""

    var nextTitle: NSString = ""
    var location: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid

    init(data : NSDictionary) {
        placeID = data["placeID"] as! NSString
        name = data["placeID"] as! NSString
        mission = data["mission"] as! NSString
        code = data["code"] as! NSString
        let nextLocation = data["nextLocale"] as! NSDictionary
        let latitude = nextLocation["latitude"] as! Double
        let longitude = nextLocation["longitude"] as! Double

        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
