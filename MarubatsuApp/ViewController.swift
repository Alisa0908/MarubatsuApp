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
    
    //if文のところのエラー回避
    var currentQuestionNum: Int = 0
    
    var questions: [[String: Any]] = []
    
    func showQuestion() {
        // UserDefaultsを使って、iPhone端末内に保存されている問題を取り出し、questions定数に格納()
        let ud = UserDefaults.standard
        let questions:[[String: Any]] = ud.object(forKey: "questions") as! [[String: Any]]
        
        // question dictionaryの数がquestionの数(0から開始)よりも大きければ
        if (questions.count > currentQuestionNum) {
            let question = questions[currentQuestionNum]
            // questionLabelにquestion文を表示
            if let que = question["question"] as? String {
                questionLabel.text = que
            }
        }
        else {
            //問題がない場合の処理
            questionLabel.text = "問題がありませんので､作成しましょう!"
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        // UserDefaultsを使って、iPhone端末内に保存されている問題を取り出し、questions定数に格納
        let ud = UserDefaults.standard
        let questions: [[String: Any]] = ud.object(forKey: "questions") as! [[String : Any]]
        
        if (questions.count > currentQuestionNum) {
            // question変数に現在の問題を格納
            let question = questions[currentQuestionNum]
            
            // questionsのanswerに登録されている情報がBoolean型かチェック
            if let ans = question["answer"] as? Bool {
                
                if yourAnswer == ans {
                    // 次の問題に進む
                    currentQuestionNum += 1
                    showAlert(message: "正解!")
                }
                else {
                    showAlert(message: "不正解...")
                }
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        if (ud.object(forKey: "questions") == nil) {
                    ud.set([], forKey: "questions")
                }
        
        showQuestion()
    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questions = []
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "questions") != nil {
            questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
        }
        showQuestion()
    }
    
}

