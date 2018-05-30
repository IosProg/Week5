//
//  TripsMapViewController.swift
//  Week5
//
//  Created by Gagan Singh on 10/5/18.
//  Copyright © 2018 Deakin University. All rights reserved.


import UIKit
import MapKit
import CoreLocation

class TripsMapViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate
{
    
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var tripMap: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripMap.delegate = self
        tripMap.showsUserLocation = true
        if Trips.trips.count <= 0 { Trips.loadTrips()}
        for trip in Trips.trips {
            tripMap.addAnnotation(trip)
        }
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05 ))
        tripMap.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationId = "viewForAnnotation"
        
        var tripView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationId)
        if (tripView == nil)
        {
            tripView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationId)
        }
    let tripAnnotation = annotation as? Trip
        if tripAnnotation == nil { return nil}
            tripView?.image = tripAnnotation?.img
            tripView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            tripView? .canShowCallout = true
           tripView?.annotation = tripAnnotation
        return tripView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let tripVC = self.storyboard?.instantiateViewController(withIdentifier: "tripDetails") as! TripDetailsViewController
        tripVC.trip = view.annotation as? Trip
        self.present(tripVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
