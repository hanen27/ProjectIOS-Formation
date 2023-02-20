//
//  ThirdController.swift
//  Navigation
//
//  Created by Hanen Abdelkrim on 27/10/2022.
//

import UIKit

class ThirdController: UIViewController {

    var text: String?
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if text != nil {
            textLabel.text = text!
        }
        else {
            print("nillll")
            
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
