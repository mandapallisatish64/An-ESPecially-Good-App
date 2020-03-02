//
//  HistoryTableViewController.swift
//  An ESPecially Good App
//
//  Created by student on 2/28/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    //swift frameworks that connects to the c
    @IBAction func clear(sender:Any){
        Predictions.shared.clearResults()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Predictions.shared.numAttempted()
        
    }
    let optimalRowHeight:CGFloat = 160
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return optimalRowHeight
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("enterd table cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "espCell", for: indexPath)
        if let question = Predictions.shared.question(at: indexPath.row){
            //print("table inside")
            let resultLBLl = cell.viewWithTag(300) as! UILabel
            let actualIV = cell.viewWithTag(100) as! UIImageView
            let predictedIV = cell.viewWithTag(200) as! UIImageView
            // print("shape\(question.actualShape!)")
            if let image = UIImage(named:"\(question.actualShape!)") {
                actualIV.image = image
            }
            
            if let image = UIImage(named:"\(question.predictedShape!)") {
                predictedIV.image = image
            }
            if question.isCorrect == true {
                // print("entred emoji")
                resultLBLl.text = "😀"
            }
            else {
                resultLBLl.text = "😡"
            }
            
        }
        // let question = Predictions.shared.question(at:indexPath.row)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
