//
//  PlayerDetailsTableViewController.swift
//  Ratings
//
//  Created by JING SHEN on 1/07/2016.
//  Copyright © 2016 JING SHEN. All rights reserved.
//

import UIKit

class PlayerDetailsTableViewController: UITableViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  
  @IBOutlet weak var detailLabel: UILabel!
  
  var player: Player?
  
  var game:String = "Chess" {
    didSet {
      detailLabel.text? = game
    }
  }
  
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 0 {
      nameTextField.becomeFirstResponder()
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SavePlayerDetail" {
      player = Player(name: nameTextField.text!, game: game, rating: 1)
    }
    
    if segue.identifier == "PickGame"{
      if let gamePickerTableViewController = segue.destinationViewController as? GamePickerTableViewController{
        gamePickerTableViewController.selectedGame = game
      }
    }
  }
  
  
  @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
    if let gamePickerTableViewController = segue.sourceViewController as? GamePickerTableViewController,
      selectedGame = gamePickerTableViewController.selectedGame {
      game = selectedGame
    }
  }
  
  
  
}
