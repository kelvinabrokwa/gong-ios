//
//  FriendTableViewController.swift
//  Gong
//
//  Created by Kelvin Abrokwa on 12/23/16.
//  Copyright © 2016 Gong. All rights reserved.
//

import UIKit
import Alamofire

class FriendTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var friends = [User]()
    var selectedFriends = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = true
        // fetch the user's friends
        loadFriends(userId: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FriendTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FriendTableViewCell else {
            fatalError("The dequeued cell is not an instance of FriendTableViewCell")
        }
        
        let friend = friends[indexPath.row]
        
        cell.usernameLabel.text = friend.username
        cell.userPhotoImageView.image = friend.photo

        // check selected friends
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        //cell.selectionStyle = .none

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        
        case "ShowGong":
            guard let gongViewController = segue.destination as? GongViewController else {
                fatalError("Unexpected Destination: \(segue.destination)")
            }
            gongViewController.friends = selectedFriends
        
        case "AddFriend":
            print("adding friend")
        
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            
        }
    }

    
    // MARK: Private Methods
    
    private func loadFriends(userId: Int) {
        let photo = UIImage(named: "defaultUserProfilePhoto")
        
        Alamofire.request("https://gng-app.herokuapp.com/users/\(userId)/friends").responseJSON { response in
        //Alamofire.request("http://localhost/users/1/friends").responseJSON { response in
            if let friendList = response.result.value {
                for friend in friendList as! [Dictionary<String, AnyObject>] {
                    let userId = friend["userId"] as! Int
                    let username = friend["username"] as! String
                    guard let friend = User(userId: userId, username: username, photo: photo) else {
                        fatalError("Unable to instantiate friend \(username) \(userId)")
                    }
                    self.friends += [friend]
                }
            }
            self.tableView.reloadData()
        }
    }

}
