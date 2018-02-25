//
//  Post.swift
//  Instagram
//
//  Created by Honorio Vega on 2/23/18.
//  Copyright © 2018 Honorio Vega. All rights reserved.
//
import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    @NSManaged var message: String

    
    /* Needed to implement PFSubclassing interface */
    class func parseClassName() -> String {
        return "Message"
    }

}
