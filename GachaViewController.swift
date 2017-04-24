//
//  GachaViewController.swift
//  Quiz_3
//
//  Created by 星野泰輔 on 2017/04/24.
//  Copyright © 2017年 星野泰輔. All rights reserved.
//

import UIKit

class GachaViewController: UIViewController {
    @IBOutlet weak var gachaImage: UIImageView!
    @IBOutlet weak var gachaButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gachaButtonAction(_ sender: UIButton){
        var ransu: Int = Int(arc4random_uniform(3))
        print(ransu)
        if ransu == 0 {
            gachaImage.image = UIImage(named: "doraemon.png")
        }else if ransu == 1 {
            gachaImage.image = UIImage(named: "doraemon2.jpg")
        }else{
            gachaImage.image = UIImage(named: "doraemon3.png")
        }
    }
    @IBAction func backToHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
