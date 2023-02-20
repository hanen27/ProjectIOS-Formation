//
//  ViewController.swift
//  Navigation
//
//  Created by Hanen Abdelkrim on 27/10/2022.
//

import UIKit

class ViewController: UIViewController {

    
     let identifierAvecSegue = "AvecSender"
    let identifierAvecDetail = "AvecDetail"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierAvecSegue {
            if let nextController = segue.destination as? ThirdController {
                // code à effectuer
                if let color = sender as? UIColor {
                    nextController.view.backgroundColor = color
                }
            }
        }
        if segue.identifier == identifierAvecDetail {
            if let next = segue.destination as? ThirdController {
                next.text = "on a passé"
            }
        }
    }

    @IBAction func buttonSenderPressed(_ sender: UIButton) {
        performSegue(withIdentifier: identifierAvecSegue, sender: UIColor.systemRed)
    }
    
    @IBAction func bttonDetailPressed(_ sender: UIButton) {
        performSegue(withIdentifier: identifierAvecDetail , sender: nil)
    }
    
    
    @IBAction func noStoryPressed(_ sender: Any) {
        let noStory = NoStoryboardController()
present(noStory, animated: true, completion: nil)    }
}

