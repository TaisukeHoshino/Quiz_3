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
    override func viewDidLoad() {
        super.viewDidLoad()

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
