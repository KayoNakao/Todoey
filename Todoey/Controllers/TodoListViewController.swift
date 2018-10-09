//
//  ViewController.swift
//  Todoey
//
//  Created by 中尾 佳代 on 2018/09/15.
//  Copyright © 2018年 KayoNakao. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var todoArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        todoArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy eggs"
        todoArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demongorgon"
        todoArray.append(newItem3)

        if let itemArray = UserDefaults.standard.array(forKey: "todoArray") as? [Item]{
            todoArray = itemArray
        }
        
    }

    //MARK - Tableview Datasource Method

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoArray.count
        
      }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
    
        let item = todoArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }

    //MARK - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(todoArray[indexPath.row])
        
        todoArray[indexPath.row].done = !todoArray[indexPath.row].done
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        }else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.todoArray.append(newItem)
            
            self.defaults.set(self.todoArray, forKey: "todoArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

}

