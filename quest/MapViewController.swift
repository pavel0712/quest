//
//  MapViewController.swift
//  quest
//
//  Created by Pavel Oleinic on 5/3/19.
//  Copyright © 2019 Pavel Oleinic. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:false)

        guard let place = DBManager.sharedInstance.selectedPlace else {
            return
        }

        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)

        let region = MKCoordinateRegion(center: place.location, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = place.location
        annotation.title = place.nextTitle
        annotation.subtitle = place.nextSubtitle
        mapView.addAnnotation(annotation)

        self.mapView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func endOfTravel(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800);
        mapView.setRegion(mapView.regionThatFits(region), animated: true);
    }
}
