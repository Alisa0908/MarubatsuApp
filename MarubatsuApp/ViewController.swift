//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 松尾有紗 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    var questionArray: [String] = []

    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    
//    let questions: [[String: Any]] = [
//        [
//            "question": "iPhoneアプリを開発する統合環境はZcodeである",
//            "answer": false
//        ],
//        [
//            "question": "Xcode画面の右側にはユーティリティーズがある",
//            "answer": true
//        ],
//        [
//            "question": "UILabelは文字列を表示する際に利用する",
//            "answer": true
//        ]
//    ]
    
    func showQuestion() {
        // question = 配列の名前[配列番号] となっている
        let question = questions[currentQuestionNum]
        // dictionaryのときの､特殊な呼び出し方｡ questionの､問題の内容だけ取り出している
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
    
        let question = questions[currentQuestionNum]

        if let ans = question["answer"] as? Bool {

            if yourAnswer == ans {
                currentQuestionNum += 1
                showAlert(message: "正解!")
            } else {
                //何も書かない=currentQuestionNumが変わらないので､同じ問題が再び表示される｡
                showAlert(message: "不正解…")
            }
        } else {
            print("答えが入ってません")
            return
        }
        
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }

        showQuestion()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
}

