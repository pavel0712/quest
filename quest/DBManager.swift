//
//  DBManager.swift
//  quest
//
//  Created by Pavel Oleinic on 5/6/19.
//  Copyright © 2019 Pavel Oleinic. All rights reserved.
//

import UIKit
import MapKit

private let _singletonInstance = DBManager()


class DBManager: NSObject {

    class var sharedInstance: DBManager { return _singletonInstance }

    var selectedPlace : Place?

    func existsPlaceWithID(placeID : NSString) -> Bool {
        if let path = Bundle.main.path(forResource: "PlaceList", ofType: "plist") {
            guard let arrayRoot = NSArray(contentsOfFile: path) else { return false}
            for dict in arrayRoot {
                let data = dict as! NSDictionary
                guard let dataID = data["placeID"] as? NSString else {
                    return false
                }
                print(placeID)
                print(dataID)
                if placeID.contains(dataID as String) {
                    selectedPlace = Place(data: data)
                    return true
                }
            }
        }

        return false
    }

}
