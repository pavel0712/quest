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
    var placeID: String = ""
    var name: String = ""
    var mission: String = ""
    var code: String = ""
    var nextSubtitle: String = ""
    var nextTitle: String = ""
    var location: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid

    init(data : Dictionary<String, Any>) {
        placeID = data["placeID"] as! String
        name = data["placeID"] as! String
        mission = data["mission"] as! String
        code = data["code"] as! String
        let nextLocation = data["nextLocale"] as! Dictionary<String, Any>
        let latitude = nextLocation["latitude"] as! Double
        let longitude = nextLocation["longitude"] as! Double
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        nextTitle = nextLocation["title"] as! String
        nextSubtitle = nextLocation["subtitle"] as! String
    }
}
