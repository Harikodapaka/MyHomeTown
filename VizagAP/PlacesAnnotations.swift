//
//  Artwork.swift
//  VizagAP
//
//  Created by Chaitanya Kodapaka on 2019-08-06.
//  Copyright © 2019 India. All rights reserved.
//

import Foundation
import UIKit
import MapKit

enum PlaceType {
    case touristCenters
    case hotels
    case restaurants
    case movies
    case place
}

class PlaceAnnotation:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PlaceType
    init(_ latitude:CLLocationDegrees,_ longitude:CLLocationDegrees,title:String,subtitle:String,type:PlaceType){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}


class PlaceAnnotations: NSObject {
    var places:[PlaceAnnotation]
    
    override init(){
        
        places =  [PlaceAnnotation(17.6883309,83.2253837, title: "Vizag", subtitle:"Visakhapatnam", type: .place)]
        places += [PlaceAnnotation(17.726124,83.223753, title: "Airport", subtitle:"This is the Vizag International Airport", type: .touristCenters)]
        places += [PlaceAnnotation(17.7173857,83.3302047, title: "INS Kursura Submarine Museum", subtitle:"Indian Navy Submarine Museum", type: .touristCenters)]
        places += [PlaceAnnotation(17.7679733,83.3452308, title: "Zoo Park", subtitle:"Indira Gandhi National Zoological Park", type: .touristCenters)]
        places += [PlaceAnnotation(17.7142015,83.323562, title: "RK Beach", subtitle:"Ramakrishna Beach", type: .touristCenters)]
        places += [PlaceAnnotation(17.7124431,83.3013695, title: "INOX Movie", subtitle:"INOX Movie Theater", type: .movies)]
        
        places += [PlaceAnnotation(17.710705, 83.315874 , title: "Novotel Hotel", subtitle:"Novotel Visakhapatnam Varun Beach", type: .hotels)]
        places += [PlaceAnnotation(17.7210916,83.336679 , title: "VISTA", subtitle:"Vista Restaurant", type: .restaurants)]
        places += [PlaceAnnotation(17.7438354,83.3144854, title: "Treebo Trend Celeste", subtitle:"Treebo Trend Celeste Hotel", type: .hotels)]
        places += [PlaceAnnotation(17.7175088,83.3184692, title: "Barbeque Nation", subtitle:"Barbeque Nation Restaurant", type: .restaurants)]
    }
}
