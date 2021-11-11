//
//  CreateViewController.swift
//  MarubatsuApp
//
//  Created by 松尾有紗 on 2021/11/08.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var marubatsuBtn: UISegmentedControl!
    var questions: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionField.delegate = self
    }
    
    //backボタンが押されたときの処理
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //createボタンが押されたときの処理
    @IBAction func saveBtn(_ sender: Any) {
        if questionField.text! != "" {
             var marubatsuAnswer: Bool = true
             if marubatsuBtn.selectedSegmentIndex == 0 {
                 marubatsuAnswer = false

             } else {
                 marubatsuAnswer = true
             }
            
            let userDefaults = UserDefaults.standard
            questions = []

            if userDefaults.object(forKey: "questions")  != nil {
                questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
            }
            
            questions.append(
                [
                    "question": questionField.text!,
                    "answer": marubatsuAnswer
                ])

            userDefaults.set(questions, forKey: "questions")
            showAlert(message: "問題が保存されました")
            questionField.text = ""

        } else {
            showAlert(message: "問題文を入力してください。")
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "questions")
        userDefaults.set([], forKey: "questions")
        showAlert(message: "問題をすべて削除しました。")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
