//
//  PlayersTableViewController.swift
//  Ratings
//
//  Created by JING SHEN on 30/06/2016.
//  Copyright © 2016 JING SHEN. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {
  
  var players:[Player] = playersData
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
    
    let player = players[indexPath.row] as Player
    
    cell.player = player
    
    return cell
  }
  
  @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
  }
  
  @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
    if let playerDetailsTableViewController = segue.sourceViewController as? PlayerDetailsTableViewController{
      if let player = playerDetailsTableViewController.player{
        players.append(player)
        
        //update the tableView
        let indexPath = IndexPath(row: players.count-1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
      }
    }
  }
  
}
