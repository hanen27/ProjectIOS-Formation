//
//  ViewController.swift
//  sneakExercice
//
//  Created by Hanen Abdelkrim on 1/11/2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchSexe: UISwitch!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var streppedLabel: UILabel!
    @IBOutlet weak var dataResult: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    var pointure: Int = 36
    var nom: String = ""
    var sexe: String = "boy"
    var type: String = "_city"
    var color: String = "_white"

    @IBOutlet weak var imageSneak: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setup()
        setImage()
        nameTF.delegate = self
        nameTF.layer.cornerRadius = 5
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.systemGray.cgColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        // Do any additional setup after loading the view.
    }
    func setImage (){
        print("ajahjajaj======>", sexe+type+color)
        imageSneak.image = UIImage(named: sexe+type+color)
        
        
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    func showTextForSwitch ()
    {
        switchLabel.text = switchSexe.isOn ? "Homme" : "Femme"
        sexe = switchSexe.isOn ? "boy" : "girl"
        setImage()
    }
    func getData() {
        
        dataResult.text = nom.isEmpty ? "j'ai trouvé pour vous cette chaussuredans la pointure : \(String(pointure))"
 : "Salut : \(nom ?? ""). j'ai trouvé pour vous cette chaussuredans la pointure : \(String(pointure)) "
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        showTextForSwitch()
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        streppedLabel.text = "Pointure: \(String(Int(sender.value)))"
        pointure = Int(sender.value)
        getData()

    }
    
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        guard let seg = sender as? UISegmentedControl else {return}
        print(seg.selectedSegmentIndex)
        switch seg.selectedSegmentIndex {
        case 0 : type = "_city"
        case 1 : type = "_running"
        case 2 : type = "_basket"
        default :  break

        }
        setImage()

    }
    


}
extension ViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("did change selection")
            nom = textField.text ?? ""
            getData()
        

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    var pickerElements: [String] {
        return ["Blanc", "Noir", "Rouge", "Blue" , "Vert"]
    }
    func setup() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return  pickerElements.count
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch row {
        case 0: color = "_white"
        case 1: color = "_black"
        case 2: color = "_red"
        case 3: color = "_blue"
        case 4: color = "_green"
        default : break
        }
        setImage()
        
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerElements[row]
        
    }
}

