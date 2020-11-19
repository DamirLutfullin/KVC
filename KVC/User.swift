//
//  User.swift
//  KVC
//
//  Created by Damir Lutfullin on 18.11.2020.
//

import Foundation

@objcMembers
class User: NSObject {
    dynamic var name: String = String()
    dynamic var age: String = ""
    
    override class func automaticallyNotifiesObservers(forKey key: String) -> Bool {
        return key == "name" ? false : super.automaticallyNotifiesObservers(forKey: key)
    }
}
