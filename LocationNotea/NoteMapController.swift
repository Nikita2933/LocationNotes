//
//  NoteMapController.swift
//  LocationNotea
//
//  Created by Никита on 26.05.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import UIKit
import MapKit

class NoteAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D

     var title: String?
     var subtitle: String?
    
    init(note: Note) {
        if note.locationActual != nil {
            coordinate = CLLocationCoordinate2D(latitude: note.locationActual!.lat, longitude: note.locationActual!.lon)
        } else {
            coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
    }
}

class NoteMapController: UIViewController {

    var note: Note?
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        if note?.locationActual != nil {
           mapView.addAnnotation(NoteAnnotation(note: note!))
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: note!.locationActual!.lat, longitude: note!.locationActual!.lon)
        }
       
    }
    
}

extension NoteMapController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let pin = MKPinAnnotationView(annotation:annotation, reuseIdentifier: nil)
        pin.animatesDrop = true
        return nil
    }
}
