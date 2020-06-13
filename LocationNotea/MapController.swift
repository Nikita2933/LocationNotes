//
//  MapController.swift
//  LocationNotea
//
//  Created by Никита on 08.06.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        mapView.removeAnnotations(mapView.annotations)
        
        for note in notes {
            if note.locationActual != nil {
               mapView.addAnnotation(NoteAnnotation(note: note))
            }
        }
    }
}

extension MapController : MKMapViewDelegate {
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
    let pin = MKPinAnnotationView(annotation:annotation, reuseIdentifier: nil)
    
    pin.animatesDrop = true
    pin.canShowCallout = true
    
    pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    
    return pin
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        let selectedNote = (view.annotation as! NoteAnnotation).note
        
        let noteController = storyboard?.instantiateViewController(withIdentifier: "noteSID") as! NoteController
        noteController.note = selectedNote
        
        navigationController?.pushViewController(noteController, animated: true)
    }
    
}
