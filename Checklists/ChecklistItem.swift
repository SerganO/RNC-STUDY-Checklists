//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Trainee on 2/8/19.
//  Copyright © 2019 Trainee. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject
{
    var text = ""
    var checked = false
    func toogleChecked()
    {
        checked = !checked
    }
}
