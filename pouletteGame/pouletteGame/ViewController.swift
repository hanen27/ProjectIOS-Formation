//
//  ViewController.swift
//  pouletteGame
//
//  Created by Hanen Abdelkrim on 24/10/2022.
//

import UIKit

class ViewController: UIViewController {
    var score: Int = 0
    var result: Bool = false
    var  currentChiken: Int = 0
    let wrongAnswers: [Int] = [1,3,6]
    var backgroundColor : UIColor = .systemBackground
    var centerView: CGPoint!
    @IBOutlet weak var labelWin: UILabel!
    @IBOutlet var bottomButton: [UIButton]!
    @IBOutlet weak var pouletImage: UIImageView!
    @IBOutlet weak var ScoreBtn: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pouletteImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playBtn.setTitle( "Play", for: .normal)
        centerView = pouletImage.center
        pouletImage.layer.cornerRadius = 25
        ScoreBtn.text = "Score :" + String(score)
        pouletImage.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    
    func isView(_ touches: Set<UITouch>) ->Bool {
        guard let touch = touches.first else {return false}
        guard let view = touch.view else {return false}
        guard view == pouletImage else {return false}
return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isView(touches) else {return}
        print("c'est parti")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isView(touches) else {return}
        let newCenter = touches.first!.location(in: self.view)
        let width = (UIScreen.main.bounds.width / 2)
        
        if (newCenter.x < width / 2) {
            self.view.backgroundColor = .systemGreen
            if (wrongAnswers.contains(currentChiken)) {
                self.result = false
                
            }
            else {
                self.result = true

            }
       

        } else if (newCenter.x > width / 2 + width) {
            self.view.backgroundColor = .systemRed
            
            if (wrongAnswers.contains(currentChiken)) {
                self.result = true
                
            }
            else {
                self.result = false

            }

        }
        pouletImage.center = newCenter



    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isView(touches) else {return}
        pouletImage.center = centerView
        self.view.backgroundColor = .systemBackground
        if (result) {
            labelWin.text = "Gagné"
            labelWin.isHidden = false

            self.score = self.score + 1
            ScoreBtn.text = "Score :" + String(score)

            setupChicken()
        }
        else {
            labelWin.text = "Perdu"
            labelWin.isHidden = false
            if (self.score > 0 )
             {
                self.score -= 1
                
            }
            ScoreBtn.text = "Score :" + String(score)
            setupChicken()
            
        }
        


    }
    
    
    
    
    
    
    func setupChicken ()
    {
        currentChiken = Int.random(in: 0...7)
        let imageString = "poule\(currentChiken)"
        let image = UIImage(named: imageString )
        pouletImage.image = image
    }
    func hidden ()
    {
        bottomButton[0].isHidden = false
        bottomButton[1].isHidden = false
    }
    @IBAction func playBtnPressed(_ sender: UIButton) {
        if(sender.currentTitle == "Play") {
            playBtn.setTitle( "Stop", for: .normal)
            hidden()
            setupChicken()
        } else {
            playBtn.setTitle( "Play", for: .normal)
            bottomButton[0].isHidden = true
            bottomButton[1].isHidden = true
            labelWin.isHidden = true

        }

        
       
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0 :
            hidden()

            if (wrongAnswers.contains(currentChiken)) {
                labelWin.text = "Perdu"
                labelWin.isHidden = false
                if (self.score > 0 )
                 {
                    self.score -= 1
                    
                }
                ScoreBtn.text = "Score :" + String(score)

                setupChicken()

            }
            else {
                labelWin.text = "Gagné"
                labelWin.isHidden = false
                bottomButton[0].backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)

                self.score = self.score + 1
                ScoreBtn.text = "Score :" + String(score)

                setupChicken()
                
            }

        case 1 :
            hidden()

            if (wrongAnswers.contains(currentChiken)) {
                labelWin.text = "Gagné"
                labelWin.isHidden = false
    
                self.score = self.score + 1
                ScoreBtn.text = "Score :" + String(score)

                setupChicken()

            } else {
                labelWin.text = "Perdu"
                labelWin.isHidden = false
                bottomButton[1].backgroundColor = UIColor(red: 1.0, green: 0.4, blue: 0.2, alpha: 0.5)
                
                if (self.score > 0 )
                 {
                    self.score -= 1
                    
                }
                
                   
                ScoreBtn.text = "Score :" + String(score)

                setupChicken()
            }
            
            
       
        default: break
        }
    }
    
}

