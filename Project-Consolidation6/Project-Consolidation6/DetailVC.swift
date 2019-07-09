//
//  DetailVC.swift
//  Project-Consolidation6
//
//  Created by Antoni on 09/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit
import SVGKit

class DetailVC: UITableViewController {

    @IBOutlet var flagImageView: UIImageView!
    
    var countryDetail: CountryData!
    var tableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        title = countryDetail.name
        
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        let svgImage = SVGKImage(contentsOf: URL(string: countryDetail.flag))
        flagImageView.image = svgImage?.uiImage
        
        tableData.append("REGION: \(countryDetail.region)")
        tableData.append("SUBREGION: \(countryDetail.subregion)")
        tableData.append("AREA: \(countryDetail.area!) km2" )
        tableData.append("CURRENCY: \(countryDetail.currencies[0].name!)")
        tableData.append("NATIVE NAME: \(countryDetail.nativeName)")
        tableData.append("POPULATION: \(countryDetail.population)")
        
     
    }
    
    @objc func shareTapped() {
        let list = tableData.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }


}
