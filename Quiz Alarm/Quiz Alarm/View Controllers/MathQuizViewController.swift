//
//  MathQuizViewController.swift
//  Quiz Alarm
//
//  Created by Channing Thornton on 8/5/21.
//

import UIKit
import AVFoundation


class MathQuizViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelTopNumber: UILabel!
    @IBOutlet weak var labelBottomNumber: UILabel!
    @IBOutlet weak var labelSign: UILabel!
    @IBOutlet weak var labelNegativeSign: UILabel!
    @IBOutlet weak var textFieldAnswer: UITextField!
    @IBOutlet weak var imageCheck1: UIImageView!
    @IBOutlet weak var imageCheck2: UIImageView!
    @IBOutlet weak var imageCheck3: UIImageView!
    
    private var player: AVAudioPlayer?
    private var answer = 0
    var repeatCount = 3
    private var solvedTimes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateQuiz()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        do {
            // https://codewithchris.com/avaudioplayer-tutorial/
            if let sound = Bundle.main.path(forResource: "Mozart", ofType: "mp3") {
                self.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                self.player?.play()
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.stop()
    }

    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {

        if let input = textFieldAnswer.text {
            if let guess = Int(input) {
                if guess == abs(answer) {
                    
                    solvedTimes = solvedTimes + 1
                    
                    switch solvedTimes {
                    case 1:
                        imageCheck1.image = UIImage(named: "tick")
                    case 2:
                        imageCheck2.image = UIImage(named: "tick")
                    case 3:
                        imageCheck3.image = UIImage(named: "tick")
                    default:
                        imageCheck1.image = UIImage(named: "tick")
                    }
                    
                    if solvedTimes == repeatCount {
                        self.dismiss(animated: true, completion: nil)
                    }
                    else {
                        generateQuiz()
                    }
                }
            }
        }
    }


    func generateQuiz() {
        
        let num1 = Int.random(in: 2...9)
        let num2 = Int.random(in: 2...9)
        let signType = Int.random(in: 1...3)

        labelTopNumber.text = "\(num1)"
        labelBottomNumber.text = "\(num2)"
        
        switch signType {
        case 1:
            answer = num1 + num2
            labelSign.text = "+"
        case 2:
            answer = num1 * num2
            labelSign.text = "X"
        case 3:
            answer = num1 - num2
            labelSign.text = "-"
        default:
            labelSign.text = "+"
            answer = num1 + num2
        }
        
        if answer < 0 {
            labelNegativeSign.text = "-"
        }
        else {
            labelNegativeSign.text = ""
        }
        
        textFieldAnswer.text = ""
        textFieldAnswer.becomeFirstResponder()

    }
}
