//
//  FriendTableViewController.swift
//  Gong
//
//  Created by Kelvin Abrokwa on 12/23/16.
//  Copyright © 2016 Gong. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var friends = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Private Methods
    
    private func loadFriends(userId: Int) {
        
        let photo = UIImage(named: "defaultUserProfilePhoto")
        
        // this will become a network request
        guard let friend2 = User(userId: 2, username: "billy", photo: photo) else {
            fatalError("Unable to instantiate friend 2")
        }
        
        guard let friend3 = User(userId: 3, username: "sally", photo: photo) else {
            fatalError("Unable to instantiate friend 3")
        }
        
        guard let friend4 = User(userId: 4, username: "martha", photo: photo) else {
            fatalError("Unable to instantiate friend 4")
        }
        
        friends += [friend2, friend3, friend4]
    }

}
