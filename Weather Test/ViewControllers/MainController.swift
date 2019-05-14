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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: weather_cell_RI)
        tableView.register(UINib(nibName: "UnassignedTableViewCell", bundle: nil), forCellReuseIdentifier: weather_cell_RI)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: weather_cell_RI, for: indexPath) as! UnassignedTableViewCell
        return cell
    }
    
    
}
