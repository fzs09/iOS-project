//
//  SegmentViewController.swift
//  ProjectMobil
//
//  Created by MobioApp2 on 7/20/17.
//  Copyright © 2017 MobioApp2. All rights reserved.
//

import UIKit
import  GoogleMaps

class SegmentViewController: UIViewController, GMSMapViewDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var mapViewOutlet: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showMap()
        mapViewOutlet.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showMap(){
    
        let camera = GMSCameraPosition.camera(withLatitude: 23.7740, longitude: 90.3664, zoom: 6.0)
        
        mapViewOutlet.camera = camera
        mapViewOutlet.delegate = self
        mapViewOutlet.isMyLocationEnabled = true
        mapViewOutlet.settings.myLocationButton = true
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 23.09, longitude: 90.08)
        marker.title = "this is the map title"
        marker.snippet = "GoogleMap"
        marker.map = mapViewOutlet


    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
        switch segmentOutlet.selectedSegmentIndex {
        case 0:
            tableViewOutlet.isHidden = false
            mapViewOutlet.isHidden = true
        case 1:
            tableViewOutlet.isHidden = true
            mapViewOutlet.isHidden = false
        default:
            break
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifierForCell") as? CellOfTableView  else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
            
        }
        
       
        return cell
    }
 

}
