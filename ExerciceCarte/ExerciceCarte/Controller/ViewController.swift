//
//  ViewController.swift
//  ExerciceCarte
//
//  Created by Hanen Abdelkrim on 9/11/2022.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var tableViewClub: UITableView!
    var clubs: [Club] = Datas.shared.allClubs
    let reuseID = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewClub.delegate = self
        tableViewClub.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let detail = segue.destination as? DetailsViewController {
                detail.club = sender as? Club
            }
        }
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let center = CLLocationCoordinate2D(latitude: clubs[indexPath.row].stadium.lat, longitude:  clubs[indexPath.row].stadium.lon)
        let degress = 0.3
        let span = MKCoordinateSpan(latitudeDelta: degress, longitudeDelta: degress)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: center, span: span)
        if let cellReuse = tableView.dequeueReusableCell(withIdentifier: reuseID) as? ClubCell {
            cellReuse.setup(satduim: clubs[indexPath.row].name, image: clubs[indexPath.row].nickname, name: clubs[indexPath.row].city, region: region)
            return cellReuse
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        var config = cell.defaultContentConfiguration()
        config.text = "je suis sur la row : \(row)"
        config.secondaryText = "et aussi sur la section numéro :\(section)"
        config.textProperties.color = .systemMint
        config.textProperties.font =  .boldSystemFont(ofSize: 17)
        config.image = UIImage(systemName:  "house.fill")
        cell.contentConfiguration = config
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clubelect = clubs[indexPath.row]
performSegue(withIdentifier: "detail", sender: clubelect)
    }
    
}

