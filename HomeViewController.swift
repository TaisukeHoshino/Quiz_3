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
