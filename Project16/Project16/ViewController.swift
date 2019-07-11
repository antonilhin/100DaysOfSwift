//
//  ViewController.swift
//  Project16
//
//  Created by Antoni on 11/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Capital Cities"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Map Stype", style: .plain, target: self, action: #selector(changeMapType))
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.", wikipedia: "https://en.wikipedia.org/wiki/London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", wikipedia: "https://en.wikipedia.org/wiki/Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.", wikipedia: "https://en.wikipedia.org/wiki/Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.", wikipedia: "https://en.wikipedia.org/wiki/Rome")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", wikipedia: "https://en.wikipedia.org/wiki/Washington,_D.C.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
    }
    
    @objc func changeMapType() {
        let ac = UIAlertController(title: "Choose map style", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .standard
        }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .satelliteFlyover
        }))
        ac.addAction(UIAlertAction(title: "Hybrid Flyouver", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .hybridFlyover
        }))
        ac.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { [weak self] _ in
            self?.mapView.mapType = .mutedStandard
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.tintColor = .blue
            annotationView?.pinTintColor = .blue
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let vc = DetailVC()
        vc.placeName = capital.title
        vc.wikiUrl = capital.wikipedia
        navigationController?.pushViewController(vc, animated: true)
    }

}

