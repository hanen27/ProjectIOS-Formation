//
//  simpleNavigation.swift
//  Navigation
//
//  Created by Hanen Abdelkrim on 27/10/2022.
//

import UIKit

class simpleNavigation: UIViewController {
    var showNav = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = !showNav
        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeController(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
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
