//
//  User.swift
//  PianoBar
//
//  Created by David Swaintek on 6/13/16.
//  Copyright © 2016 David Swaintek. All rights reserved.
//

import Foundation

class User
{
    let name: String
    let profileImgUrl: String
    let location: String
    
    let screenName: String
    
    init?(json: [String : AnyObject])
    {
        if let name = json["name"] as? String, profileImgUrl = json["profile_image_url"] as? String,
            location = json["location"] as? String, screenName = json["screen_name"] as? String {
            self.name = name
            self.profileImgUrl = profileImgUrl
            self.location = location
            self.screenName = screenName
        }
        else {
            return nil
        }
    }
}