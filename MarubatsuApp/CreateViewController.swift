//
//  CreateViewController.swift
//  MarubatsuApp
//
//  Created by 松尾有紗 on 2021/11/08.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var marubatsuBtn: UISegmentedControl!
//    var questionArray: [String] = []
    
    //backボタンが押されたときの処理
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //createボタンが押されたときの処理
    @IBAction func saveBtn(_ sender: Any) {
        //最初にanswerの情報登録する(なぜ?)
        var answer: Bool = true
         
        //マルバツの情報登録
         if marubatsuBtn.selectedSegmentIndex == 0 {
             answer = false
         }
         else {
             answer = true
         }
         
        //questionFieldに登録した値(右)を､左に新しい関数を登録する
         let questionText:String = questionField.text!
         
        let ud = UserDefaults.standard
        //questions dictionaryの情報登録
        var questions: [[String: Any]] = ud.object(forKey: "questions") as! [[String : Any]]
    
        //questions dictionaryに値を登録している
         questions.append( [
            //39行目のやつ
             "question": questionText,
             //32, 35行目のやつ
             "answer": answer
         ])
         
         ud.setValue(questions, forKey: "questions")
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let ud = UserDefaults.standard
        
        // 保存されている値を削除
        ud.removeObject(forKey: "questions")
        
        // 空のarrayをset(for エラー回避)
        ud.setValue([], forKey: "questions")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
