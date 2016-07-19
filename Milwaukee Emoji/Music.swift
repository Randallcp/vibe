//
//  Music.swift
//  Emoji Keyboard
//
//  Created by Randy Perecman on 7/18/16.
//  Copyright © 2016 OnMilwaukee. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Music {
    
    var song: String
    var artist: String
    var url: String
    
    init(json: JSON) {
        self.song = json["trackName"].stringValue
        self.artist = json["artistName"].stringValue
        self.url = json["previewUrl"].stringValue
    }
    
}