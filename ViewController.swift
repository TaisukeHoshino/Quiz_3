//
//  ViewController.swift
//  Quiz_3
//
//  Created by 星野泰輔 on 2017/04/19.
//  Copyright © 2017年 星野泰輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var quizTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Quizのインスタンス生成
        let quiz1 = Quiz(option1: "1000cm", option2: "2000cm", option3: "3000cm", text: "私の身長は？", answer: "1000cm")
        let quiz2 = Quiz(option1: "1000cm", option2: "2000cm", option3: "3000cm", text: "私の身長は？", answer: "1000cm")
        let quiz3 = Quiz(option1: "1000cm", option2: "2000cm", option3: "3000cm", text: "私の身長は？", answer: "1000cm")
        
        //クイズのビュー(テキスト？)に値を入れる
        quizTextView.text = quiz1.text
        button1.setTitle(quiz1.option1, for: .normal)
        button2.setTitle(quiz1.option2, for: .normal)
        button3.setTitle(quiz1.option3, for: .normal)
        
        
        
    }


    
    
    @IBAction func button1Action(_ sender: UIButton) {
        if button1.titleLabel?.text == quiz1.answer{
            print("正解")
        }
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class Quiz{
    //クイズの選択肢３つの初期設定
    var option1: String
    var option2: String
    var option3: String
    
    //クイズの問題文の初期設定
    var text: String
    //答えの初期設定
    var answer: String
    
    init(option1: String, option2: String, option3: String,text: String, answer: String) {
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.text = text
        self.answer = answer
    }
    
    //シャッフルメソッド定義
    
}
