//
//  ViewController.swift
//  Checklists
//
//  Created by Trainee on 2/8/19.
//  Copyright © 2019 Trainee. All rights reserved.
//

import UIKit



class ChecklistViewController: UITableViewController,AddItemViewControllerDelegate {
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
   
    let row0item = ChecklistItem()
    let row1item = ChecklistItem()
    let row2item = ChecklistItem()
    let row3item = ChecklistItem()
    let row4item = ChecklistItem()
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func prepare(for seque: UIStoryboardSegue,sender:Any?)
    {
        if seque.identifier == "AddItem"
        {
         let controller = seque.destination as! AddItemViewController
            controller.delegate = self
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                               cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem",
                for: indexPath)
            
            let item = items[indexPath.row]
            
            configureText(for: cell, with: item)
            configureCheckmark(for: cell, with: item)
            return cell
    }
    
    override func tableView(_ tableView: UITableView,
                               didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toogleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell,
                            with item:ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell,
                          with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    @IBAction func addItem()
    {
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "I am a new row"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        // 1
        items.remove(at: indexPath.row)
        
        // 2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}
