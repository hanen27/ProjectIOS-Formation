//
//  SecondController.swift
//  PlusLoinDansUIKit
//
//  Created by Hanen Abdelkrim on 26/10/2022.
//

import UIKit

class SecondController: UIViewController {
    @IBOutlet weak var suppBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("second view")
        createView()
        frameVsBounds()
    }
    
    func createViewWithConstraint() {
        v = UIView()
        self.view.addSubview(v)
    }
    func createView(){
        //x
        let x: CGFloat = 69
        //y
        let y: CGFloat = 0        //width
        let width: CGFloat = 200
        //height
        let height: CGFloat = 128
        let size: CGSize = CGSize(width: width, height: height)
        let point: CGPoint = CGPoint(x: x, y: y)
        let rect = CGRect(origin: point, size: size)
        // let rect: CGRect = CGRect(x: x, y: y, width: width , height: height)
        let view: UIView = UIView(frame: rect)
        view .backgroundColor = .systemRed
        self.view.addSubview(view)
        let frame = self.view.frame
        let greenView = UIView(frame: CGRect(
            x: 20, y: frame.height / 2 - (frame.height / 10),
            width: frame.width - 40,
            height: frame.height / 10))
        greenView.backgroundColor = .green
        self.view.addSubview(greenView)
        
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        for subVIEW in self.view.subviews {
            subVIEW.removeFromSuperview()
        }
    }
    func frameVsBounds(){
        print("Frame: \(view.frame)")
        print("bounds: \(view.bounds)")

    }
}
