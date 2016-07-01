//
//  GamePickerTableViewController.swift
//  Ratings
//
//  Created by JING SHEN on 1/07/2016.
//  Copyright © 2016 JING SHEN. All rights reserved.
//

import UIKit

class GamePickerTableViewController: UITableViewController {
  
  
  var games:[String] = [
    "Angry Birds",
    "Chess",
    "Russian Roulette",
    "Spin the Bottle",
    "Texas Hold'em Poker",
    "Tic-Tac-Toe"]
  
  var selectedGame:String? {
    didSet {
      if let game = selectedGame {
        selectedGameIndex = games.index(of: game)!
      }
    }
  }
  var selectedGameIndex:Int?
  
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return games.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
    
    cell.textLabel?.text = games[indexPath.row]
    
    if indexPath.row == selectedGameIndex{
      cell.accessoryType = .checkmark
    }else{
      cell.accessoryType = .none
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if let index = selectedGameIndex{
      let row = IndexPath(row: index, section: 0)
      let cell = tableView.cellForRow(at: row)
      cell?.accessoryType = .none
    }
    
    selectedGame = games[indexPath.row]
    
    //update the checkmark for current row
    let cell = tableView.cellForRow(at: indexPath)
    cell?.accessoryType = .checkmark
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SaveSelectedGame" {
      if let cell = sender as? UITableViewCell{
        let indexPath = tableView.indexPath(for: cell)
        if let index = indexPath?.row{
          selectedGame = games[index]
        }
      }
    }
  }
  
}
