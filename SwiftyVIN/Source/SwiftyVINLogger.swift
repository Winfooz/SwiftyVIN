//
//  SwiftyVINLogger.swift
//  SwiftyVIN
//
//  Created by Majd Sabah on 10/8/18.
//  Copyright © 2018 Majd Sabah. All rights reserved.
//

import Foundation

public class SwiftyVINLogger {
    
    /// The shared swifty VIN logger for the system.
    public static let shared = SwiftyVINLogger()
    
    /// The debug mode flag 'true' means will show log, 'false' means will show nothing.
    public var debugMode: Bool = false
    
}
