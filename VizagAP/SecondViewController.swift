//
//  SecondViewController.swift
//  VizagAP
//
//  Created by Chaitanya Kodapaka on 2019-08-06.
//  Copyright © 2019 India. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let placeAnnotations = PlaceAnnotations()
    let initialCoordinate = CLLocationCoordinate2DMake(17.6883309,83.2253837)
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard let annotation = annotation as? PlaceAnnotation else {return nil}
        var identifier = ""
        var img = ""
        var color = hexStringToUIColor(hex: "#2b78fe")
        switch annotation.type{
        case .touristCenters:
            identifier = "TouristCenters"
            color = hexStringToUIColor(hex: "#4db546")
            img = "outline_local_activity_black_36pt_2x"
        case .hotels:
            identifier = "Hotels"
            color = hexStringToUIColor(hex: "#2b78fe")
            img = "outline_hotel_black_36pt_2x"
        case .restaurants:
            identifier = "Restaurants"
            color = hexStringToUIColor(hex: "#f88181")
            img = "outline_restaurant_black_36pt_2x"
        case .movies:
            identifier = "MovieTheaters"
            color = hexStringToUIColor(hex: "#13b5c7")
            img = "outline_local_movies_black_36pt_2x"
        case .place:
            identifier = "Place"
        }
        if let dequedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView.markerTintColor = color
        annotationView.glyphImage = UIImage(named: img)
        annotationView.glyphTintColor = .white
        annotationView.clusteringIdentifier = identifier
        return annotationView
    }
    var stepperVal = 0
    @IBAction func setpper(_ sender: UIStepper) {
//        stepperVal = Int(sender.value)
        print(sender.value, stepperVal)
        if(stepperVal < Int(sender.value)){
            zoom(true)
            stepperVal += 1
        }else{
            zoom(false)
            stepperVal -= 1
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self as MKMapViewDelegate
        //set intial region
        let initialregion = MKCoordinateRegion(center: initialCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
        
        map.setRegion(initialregion, animated: true)
        // add the annotations
        map.addAnnotations(placeAnnotations.places)
    }
    func zoom(_ zoomin : Bool) {
        var region = map.region;
        var span = MKCoordinateSpan();
        span.latitudeDelta = zoomin ? region.span.latitudeDelta / 2 :  region.span.latitudeDelta * 2;
        span.longitudeDelta = zoomin ? region.span.longitudeDelta / 2 : region.span.longitudeDelta * 2;
        region.span = span;
        
        map.setRegion(region, animated: true);
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
