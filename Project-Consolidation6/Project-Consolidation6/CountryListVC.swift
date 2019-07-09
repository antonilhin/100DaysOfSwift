//
//  CountryListVC.swift
//  Project-Consolidation6
//
//  Created by Antoni on 09/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit

class CountryListVC: UITableViewController {

    var countries = [CountryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Countries"
        
        guard let dataUrl = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            fatalError("Error to get data url")
        }
        
        guard let data = try? Data(contentsOf: dataUrl) else {
            fatalError("Error  to load data")
        }
        
        guard let jsData = try? JSONDecoder().decode([CountryData].self, from: data) else {
            fatalError("Error  to decode data")
        }
        
        countries = jsData
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        detailVC.countryDetail = countries[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }



}
