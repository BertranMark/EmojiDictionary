//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Bertran on 11.10.2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    var emoji = Emoji(symbol: "", name: "", description: "", usage: "")
    
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var usage: UITextField!
    
    @IBOutlet weak var descr: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var symbol: UITextField!
   
    
    @IBAction func textEditingChanged(_ sender: UITextField){
            updateSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = emoji.name
        symbol.text = emoji.symbol
        descr.text = emoji.description
        usage.text = emoji.usage
        
        updateSaveButtonState()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func updateSaveButtonState() {
        
       
        let symbolText = symbol.text ?? ""
        let nameText = name.text ?? ""
        let descrText = descr.text ?? ""
        let usageText = usage.text ?? ""
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descrText.isEmpty && !usageText.isEmpty && symbolText.count == 1 && symbolText.isContainEmoji()
       
    }

    
    
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "SaveUnwind" else { return }
        
        let symbolText = symbol.text ?? ""
        let nameText = name.text ?? ""
        let descrText = descr.text ?? ""
        let usageText = usage.text ?? ""
        
        emoji = Emoji(symbol: symbolText, name: nameText, description: descrText, usage: usageText)
        
    }
    

}


