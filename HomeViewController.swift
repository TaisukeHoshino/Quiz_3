//
//  HomeViewController.swift
//  Quiz_3
//
//  Created by 星野泰輔 on 2017/04/24.
//  Copyright © 2017年 星野泰輔. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var gachaButton: UIButton!
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var headerTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // コメントのTextViewに枠をつける。
        headerTextView.layer.borderWidth = 2
        
        // 枠の色を設定する。
        headerTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        // 枠の角を丸くする。
        headerTextView.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gachaButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toGacha", sender: nil)
    }

    @IBAction func quizButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toQuiz", sender: nil)

    }
 }
