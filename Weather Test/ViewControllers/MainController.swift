//
//  MainViewController.swift
//  Weather Test
//
//  Created by Natalia Martin on 13/05/2019.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let weather_cell_RI = "WeatherReuseIdentifier"
    let unassigned_cell_RI = "UnassignedReuseIdentifier"
    var weathers = [WeatherDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: weather_cell_RI)
        tableView.register(UINib(nibName: "UnassignedTableViewCell", bundle: nil), forCellReuseIdentifier: unassigned_cell_RI)
        getWeathers()
    }
    
    func getWeathers() {
        weathers = [WeatherDataModel(cityName: "BS AS", temp: 15, iconID: "01d"),
        WeatherDataModel(cityName: "Lorem ipsum dolor sit amet", temp: 30, iconID: "10n")]
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if weathers.count <= indexPath.row {
            return tableView.dequeueReusableCell(withIdentifier: unassigned_cell_RI, for: indexPath) as! UnassignedTableViewCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: weather_cell_RI, for: indexPath) as! WeatherTableViewCell
        cell.iconIV.image = #imageLiteral(resourceName: "cell_placeholder")
        cell.iconIV.imageFromUrl(URL(string: "http://openweathermap.org/img/w/" + weathers[indexPath.row].iconID + ".png")!)
        cell.locationLbl.text = weathers[indexPath.row].cityName
        cell.tempLbl.text = String(weathers[indexPath.row].temp) + "ºC"
        cell.gpsIcon.isHidden = indexPath.row > 0
        return cell
    }
    
    
}
