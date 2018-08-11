//
//  saveData.swift
//  V Authentication
//
//  Created by Apple on 09/08/18.
//  Copyright © 2018 senovTech. All rights reserved.
//

import Foundation

class SaveData {
    var name:String?
    var phNumber:String?
    var city:String?
    var intraducerName:String?
    init(name:String?,phNumber:String?,city:String?,intraducerName:String?) {
        self.name=name
        self.phNumber=phNumber
        self.city=city
        self.intraducerName=intraducerName
    }
    
}
