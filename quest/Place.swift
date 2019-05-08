//
//  Place.swift
//  quest
//
//  Created by Pavel Oleinic on 5/6/19.
//  Copyright © 2019 Pavel Oleinic. All rights reserved.
//

import UIKit
import MapKit

struct Place {
    let placeID: String
    let name: String
    let mission: String
    let code: String
    let nextSubtitle: String
    let nextTitle: String
    let location: CLLocationCoordinate2D

    init(data: [String: Any]) {
        placeID = data["placeID"] as! String
        name = data["name"] as? String ?? ""
        mission = data["mission"] as? String ?? ""
        code = data["code"] as! String
        let nextLocation = data["nextLocale"] as! [String: Any]
        let latitude = nextLocation["latitude"] as! Double
        let longitude = nextLocation["longitude"] as! Double
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        nextTitle = nextLocation["title"] as? String ?? ""
        nextSubtitle = nextLocation["subtitle"] as? String ?? ""
    }
}
