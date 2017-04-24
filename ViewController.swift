//
//  ViewController.swift
//  Quiz_3
//
//  Created by 星野泰輔 on 2017/04/19.
//  Copyright © 2017年 星野泰輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var quizNumber: Int = 0
    var tokuten: Int = 0

    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var hintoButton: UIButton!
    
    var quizArray: [Quiz] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Quizのインスタンス生成
        let quiz1 = Quiz(option1: "1000cm", option2: "2000cm", option3: "3000cm", text: "私の身長は？", answer: "1000cm")
        let quiz2 = Quiz(option1: "1111cm", option2: "2222cm", option3: "3333cm", text: "君の身長は？", answer: "3333cm")
        let quiz3 = Quiz(option1: "1234cm", option2: "2345m", option3: "3456cm", text: "ドラえもんの身長は？", answer: "3456cm")
        
        //配列にクイズを入れていく
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        //配列の中身をシャッフルして、もう一度入れ込む
        quizArray = Quiz.shuffle(quizArray: quizArray)
        
        //クイズのビュー(テキスト？)に値を入れる(クイズの初期値)
        showQuiz()
        
        
    }
    //次のクイズにチェンジ定義
    func chageQuiz(){
        quizNumber = quizNumber + 1
        resetQuiz()
        showQuiz()
        resetColor()
    }
    //クイズの選択肢のカラーをリセット
    func resetColor(){
        button1.setTitleColor(UIColor.blue, for: .normal) // タイトルの色
        button2.setTitleColor(UIColor.blue, for: .normal) // タイトルの色
        button3.setTitleColor(UIColor.blue, for: .normal) // タイトルの色

    }
    //クイズを表示定義
    func showQuiz(){
        quizTextView.text = quizArray[quizNumber].text
        button1.setTitle(quizArray[quizNumber].option1, for: .normal)
        button2.setTitle(quizArray[quizNumber].option2, for: .normal)
        button3.setTitle(quizArray[quizNumber].option3, for: .normal)
        print(quizArray[quizNumber].option1)
  
    }
    //クイズをリセット定義
    func resetQuiz(){
        if quizNumber == quizArray.count{
            quizNumber = 0
            if tokuten == 3 {
                trueAlertQuiz() //全問正解時アラート
            }else{
                falseAlertQuiz() //不正解時のアラート
            }
            tokuten = 0

        }
    }
    //画面遷移
    func next(){
        performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    //全問正解時のアラート定義
    func trueAlertQuiz(){
        let alertTokuten = String(tokuten)
        let alertController = UIAlertController(title: "点数", message: alertTokuten, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK!!", style: .default, handler: {(action) in self.resetQuiz()})
        let nextAction = UIAlertAction(title: "next", style: .default, handler: {(nextAction) in self.next()})
        alertController.addAction(okAction)
        alertController.addAction(nextAction)
        self.present(alertController, animated: true, completion: nil)
    }
    //不正解時のアラート定義
    func falseAlertQuiz(){
        let alertTokuten = String(tokuten)
        let alertController = UIAlertController(title: "点数", message: alertTokuten, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK!!", style: .default, handler: {(action) in self.resetQuiz()})
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    

    @IBAction func buttonAction1(_ sender: UIButton) {
        if button1.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解")
            tokuten = tokuten + 1
            chageQuiz() //次のクイズにチェンジ
        }else{
            print("不正解")
            chageQuiz() //次のクイズにチェンジ
        }
    }
    
    @IBAction func buttonAction2(_ sender: UIButton) {
        if button2.titleLabel?.text == quizArray[quizNumber].answer{
            print("正解")
            tokuten = tokuten + 1
            chageQuiz()
        }else{
            print("不正解")
            chageQuiz() //次のクイズにチェンジ
        }
    }
    
    @IBAction func buttonAction3(_ sender: UIButton) {
        if button3.titleLabel?.text == quizArray[quizNumber].answer{
            print("正解")
            tokuten = tokuten + 1
            chageQuiz()
        }else{
            print("不正解")
            chageQuiz() //次のクイズにチェンジ
        }
    }
    
    @IBAction func backToHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func hintoButtonAction(_ sender: Any) {
        if button1.titleLabel?.text == quizArray[quizNumber].answer{
            button1.setTitleColor(UIColor.red, for: .normal) // タイトルの色
        }else if button2.titleLabel?.text == quizArray[quizNumber].answer{
            button2.setTitleColor(UIColor.red, for: .normal) // タイトルの色
        }else if button3.titleLabel?.text == quizArray[quizNumber].answer{
            button3.setTitleColor(UIColor.red, for: .normal) // タイトルの色
        }else{
            print("あー")
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
    class func shuffle(quizArray: [Quiz]) -> [Quiz] {
        var quiz = quizArray
        var shuffledQuizArray: [Quiz] = []
        for _ in 0..<quiz.count{
            let index = Int(arc4random_uniform(UInt32(quiz.count)))
            shuffledQuizArray.append(quiz[index])
            quiz.remove(at: index)
        }
        
        return shuffledQuizArray
        
    }

}

@IBDesignable class CustomButton: UIButton {
    
    // 角丸の半径(0で四角形)
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    // 枠
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        // 角丸
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        // 枠線
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}
