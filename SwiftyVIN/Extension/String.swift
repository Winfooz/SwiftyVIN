//
//  String.swift
//  SwiftyVIN
//
//  Created by Majd Sabah on 10/7/18.
//  Copyright © 2018 Majd Sabah. All rights reserved.
//

import Foundation

internal extension String {
   
    subscript (i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)] as Character)
    }
    
}
