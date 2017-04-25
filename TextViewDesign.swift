//
//  TextViewDesign.swift
//  Quiz_3
//
//  Created by 星野泰輔 on 2017/04/25.
//  Copyright © 2017年 星野泰輔. All rights reserved.
//

import UIKit

@IBDesignable class CustomTextView: UITextView {
        var border = CALayer(layer: self.layer)
        border.frame = CGRectMake(0.0, 0.0, self.frame.size.width, borderWidth)
        border.backgroundColor = borderColor.cgColor
        self.layer.addSublayer(border)
    

}
