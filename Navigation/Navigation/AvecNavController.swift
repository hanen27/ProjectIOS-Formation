//
//  AvecNavController.swift
//  Navigation
//
//  Created by Hanen Abdelkrim on 27/10/2022.
//

import UIKit

class AvecNavController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "NoNav"    {
            if let n = segue.destination as? simpleNavigation{
                n.showNav = false
            }
        }
        else if segue.identifier == "sender" {
            if let nextController = segue.destination as? ThirdController {
                // code à effectuer
                nextController.text = sender as? String
                
            }
        }
        else if segue.identifier == "Details" {
            if let next = segue.destination as? ThirdController {
                next.text = "yes"
            }
        }// Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func noNavPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "NoNav", sender: false)
    }
    @IBAction func detailsPressed(_ sender: Any) {
        performSegue(withIdentifier: "Details" , sender: nil)
        
    }
    @IBAction func noStoryPressed(_ sender: Any) {
        let no = NoStoryboardController()
        self.navigationController?.pushViewController(no, animated: true)
    }
    
    @IBAction func senderPressed(_ sender: Any) {
        performSegue(withIdentifier: "sender" , sender: "ghhhhh")
    }
    
}
