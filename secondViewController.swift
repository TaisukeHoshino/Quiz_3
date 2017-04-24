//
//  ViewController.swift
//  Quiz_3
//
//  Created by 星野泰輔 on 2017/04/19.
//  Copyright © 2017年 星野泰輔. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    var quizNumber: Int = 0
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    var secondQuizArray: [secondQuiz] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Quizのインスタンス生成
        let quiz1 = secondQuiz(option1: "1000cm", option2: "2000cm", option3: "3000cm", text: "私の身長は？", answer: "1000cm")
        let quiz2 = secondQuiz(option1: "1111cm", option2: "2222cm", option3: "3333cm", text: "君の身長は？", answer: "3333cm")
        let quiz3 = secondQuiz(option1: "1234cm", option2: "2345m", option3: "3456cm", text: "ドラえもんの身長は？", answer: "3456cm")
        
        //配列にクイズを入れていく
        secondQuizArray.append(quiz1)
        secondQuizArray.append(quiz2)
        secondQuizArray.append(quiz3)
        //配列の中身をシャッフルして、もう一度入れ込む
        secondQuizArray = secondQuiz.shuffle(secondQuizArray: secondQuizArray)
        
        //クイズのビュー(テキスト？)に値を入れる(クイズの初期値)
        showQuiz()
        
        
    }
    //次のクイズにチェンジ定義
    func chageQuiz(){
        quizNumber = quizNumber + 1
        resetQuiz()
        showQuiz()
    }
    //クイズを表示定義
    func showQuiz(){
        quizTextView.text = secondQuizArray[quizNumber].text
        button1.setTitle(secondQuizArray[quizNumber].option1, for: .normal)
        button2.setTitle(secondQuizArray[quizNumber].option2, for: .normal)
        button3.setTitle(secondQuizArray[quizNumber].option3, for: .normal)
        print(secondQuizArray[quizNumber].option1)
        
    }
    //クイズをリセット定義
    func resetQuiz(){
        if quizNumber == secondQuizArray.count{
            quizNumber = 0
            alertQuiz() //アラート
        }
    }
    //アラート定義
    func alertQuiz(){
        let alertController = UIAlertController(title: "あああああ", message: "いいいい", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in self.resetQuiz()})
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonAction1(_ sender: UIButton) {
        if button1.titleLabel?.text == secondQuizArray[quizNumber].answer {
            print("正解")
            chageQuiz() //次のクイズにチェンジ
        }else{
            print("不正解")
        }
    }
    
    @IBAction func buttonAction2(_ sender: UIButton) {
        if button2.titleLabel?.text == secondQuizArray[quizNumber].answer{
            print("正解")
            chageQuiz()
        }else{
            print("不正解")
        }
    }
    
    @IBAction func buttonAction3(_ sender: UIButton) {
        if button3.titleLabel?.text == secondQuizArray[quizNumber].answer{
            print("正解")
            chageQuiz()
        }else{
            print("不正解")
        }
    }
    @IBAction func backToFirstQuiz(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class secondQuiz{
    //クイズの選択肢３つの初期設定
    var option1: String
    var option2: String
    var option3: String
    
    //クイズの問題文の初期設定
    var text: String
    //答えの初期設定
    var answer: String
    //
    
    init(option1: String, option2: String, option3: String,text: String, answer: String) {
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.text = text
        self.answer = answer
    }
    
    //シャッフルメソッド定義
    class func shuffle(secondQuizArray: [secondQuiz]) -> [secondQuiz] {
        var quiz = secondQuizArray
        var shuffledQuizArray: [secondQuiz] = []
        for _ in 0..<quiz.count{
            let index = Int(arc4random_uniform(UInt32(quiz.count)))
            shuffledQuizArray.append(quiz[index])
            quiz.remove(at: index)
        }
        
        return shuffledQuizArray
        
    }
}
