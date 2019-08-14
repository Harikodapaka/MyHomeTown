//
//  FirstViewController.swift
//  VizagAP
//
//  Created by Chaitanya Kodapaka on 2019-08-06.
//  Copyright © 2019 India. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    var imgArr = ["rkbeach","inskursura","Indira-gandhi-zoo-park","lighthouse-dwarka-jamnagar"]
//    var nameArr = ["RK Beach","INS Kursura Submarine","Zoo Park","Light House"]
    var places = [
    ["RK Beach", "rkbeach", "RK Beach also known as Ramakrishna Beach is situated on the East coast of Bay of Bengal in Visakhapatnam. It is located near Dolphin's Nose."],
    ["INS Kursura Submarine", "inskursura", "INS Kursura (S20) was a Kalvari-class diesel-electric submarine of the Indian Navy. She was India's fifth submarine."],
    ["Zoo Park", "Indira-gandhi-zoo-park", "Indira Gandhi Zoological Park is located amidst Kambalakonda Forest in Vizag, Andhra Pradesh, India. It is the 3rd largest zoo in the country."],
    ["Light House","lighthouse-dwarka-jamnagar", "The hill is named as Dolphin nose because it resembles a dolphin's nose. A lighthouse on this hill guided ships to enter Visakhapatnam Port."]
    ]
    var selectedIndex = -1
    var isCollapse = false
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.estimatedRowHeight = 375
        tableview.rowHeight = UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        let place = places[indexPath.row]
        cell.lblname.text! = place[0]
        cell.imgview.image = UIImage(named: "\(place[1])")
        cell.lbltext.text! = place[2]
        cell.imgview.contentMode = UIView.ContentMode.scaleToFill
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true {
            return 375
        } else {
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
            } else {
                self.isCollapse = false
            }
            
        } else {
            self.isCollapse = true
        }
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}

