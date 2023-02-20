//
//  ViewController.swift
//  PlusLoinDansUIKit
//
//  Created by Hanen Abdelkrim on 26/10/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("codeur")
    }
    override func loadView() {
        super.loadView()
        print("load view")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View didi load")
        self.view.isUserInteractionEnabled = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will a")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Did A")
        let frame = self.view.frame
        let size = frame.size
        print("la taile de lma vue de uiView est \(size)")
        let btnFrame = btn.frame
        print("Taille: \(btn.frame.size)")
        print("Point: \(btn.frame.origin)")

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("did disapper")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first else { return }
        let postion = t.location(in: self.view )
        print ("le CGPoint touché est : \(postion)  \(postion.x) et son Y : est \(postion.y)")
    }


}

