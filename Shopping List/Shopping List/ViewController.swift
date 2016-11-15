//
//  ViewController.swift
//  Shopping List
//
//  Created by Tadeusz Wyrzykowski on 04.11.2016.
//  Copyright © 2016 Tadeusz Wyrzykowski. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var items = [NSManagedObject]()
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItem()
        return true
    }
    
    func addItem() {
        let newItem = textField.text
        let trimmedItem = newItem?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (trimmedItem?.characters.count)! > 0 {
            self.saveItem(trimmedItem!, marked: false)
            tableView.reloadData()
            //let range = NSMakeRange(0, self.tableView.numberOfSections + 1)
            //let sections = NSIndexSet(indexesIn: range)
            //self.tableView.reloadSections(sections as IndexSet, with: .automatic)
        }
        
        textField.text = ""
        textField.resignFirstResponder()
    }

    func saveItem(_ item: String, marked: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newItem = NSManagedObject(entity: entity!, insertInto: context)
        
        newItem.setValue(item, forKey: "item")
        newItem.setValue(marked, forKey: "marked")
        items.append(newItem)
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteItem(_ at: Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(items[at])
        items.remove(at: at)
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func modifyItem(_ at: Int, item: String, marked: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        items[at].setValue(item, forKey: "item")
        items[at].setValue(marked, forKey: "marked")
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        
        do {
            let results = try context.fetch(fetchRequest)
            items = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        items.removeAll()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.value(forKey: "item") as! String?
        
        let marked = item.value(forKey: "marked") as! Bool?
        if marked == true {
            cell.accessoryType = .checkmark
            cell.tintColor = .green
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = tableView.cellForRow(at: indexPath)
        var isMarked = false;
        
        if selectedRow?.accessoryType != UITableViewCellAccessoryType.checkmark {
            selectedRow?.accessoryType = .checkmark
            selectedRow?.tintColor = .green
            isMarked = true
        } else {
            selectedRow?.accessoryType = .none
        }
        
        self.modifyItem(indexPath.row, item: (selectedRow?.textLabel?.text)!, marked: isMarked)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let deletedRow = tableView.cellForRow(at: indexPath)
        if editingStyle == .delete {
            self.deleteItem(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            deletedRow?.accessoryType = .none
        }
    }
    
    

}

