//
//  Checklist.swift
//  Checklists
//
//  Created by Trainee on 2/11/19.
//  Copyright © 2019 Trainee. All rights reserved.
//

import UIKit

class Checklist: NSObject,Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String)
    {
        self.name = name
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        return items.reduce(0) { cnt,
            item in cnt + (item.checked ? 0 : 1) }
    }
}
