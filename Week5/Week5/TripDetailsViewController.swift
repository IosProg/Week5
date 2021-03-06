//
//  TripDetailsViewController.swift
//  Week5
//
//  Created by Gagan Singh on 8/5/18.
//  Copyright © 2018 Deakin University. All rights reserved.
//

import UIKit

class TripDetailsViewController: UITableViewController {
    
    var trip : Trip?

    
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var destination: UITextField!
       @IBOutlet weak var duration: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTrip(_ sender: UIButton) {
    trip?.tripDestination = destination.text!
        trip?.tripDuration = Int(duration.text!)!
        trip?.tripDate = date.text!
        
    }
    override func viewDidAppear(_ animated: Bool) {
        destination.text = trip?.tripDestination
        duration.text = "\(trip!.tripDuration)"
        date.text = trip!.tripDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
