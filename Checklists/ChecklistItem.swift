//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Trainee on 2/8/19.
//  Copyright © 2019 Trainee. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable
{
    var text = ""
    var checked = false
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    
    func toogleChecked()
    {
        checked = !checked
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
