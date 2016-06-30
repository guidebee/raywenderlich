//
//  Player.swift
//  Ratings
//
//  Created by JING SHEN on 30/06/2016.
//  Copyright © 2016 JING SHEN. All rights reserved.
//

import UIKit

struct Player {
  var name: String?
  var game: String?
  var rating: Int
  
  init(name: String?, game: String?, rating: Int) {
    self.name = name
    self.game = game
    self.rating = rating
  }
}
