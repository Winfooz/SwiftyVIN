//
//  VINConstants.swift
//  SwiftyVIN
//
//  Created by Majd Sabah on 10/7/18.
//  Copyright © 2018 Majd Sabah. All rights reserved.
//

import Foundation

internal struct VINConstants {
    
    /// The characters I,O and Q are prohibited from any VIN position
    static let prohibitedCharacters: Set<Character> = ["I", "O", "Q"]
    
    /// The charactes U,Z and 0 are prohibited for the tenth VIN position
    static let prohibitedTenthCharacters: Set<Character> = ["U", "Z", "0"]
    
    /// The zero sum
    static let zeroSum: Int = 0
    
    /// The string X
    static let stringX: String = "X"
    
    /// The ninth char index
    static let ninthCharIndex: Int = 8
    
    /// The tenth char index
    static let tenthCharIndex: Int = 9
    
    /// The ten integer
    static let ten: Int = 10
    
    /// The divisor integer
    static let divisor: Int = 11
    
    /// The vin maximum length
    static let vinMaxLength: Int = 17
    
    /// The vin weights for each index of vin character
    static let vinWeights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2]
    
    /// The vin characters translation
    static let vinTranslations: [String: Int] = [
        "A": 1, "L": 3, "Y": 8,
        "B": 2, "M": 4, "Z": 9,
        "C": 3, "N": 5, "1": 1,
        "D": 4, "P": 7, "2": 2,
        "E": 5, "R": 9, "3": 3,
        "F": 6, "S": 2, "4": 4,
        "G": 7, "T": 3, "5": 5,
        "H": 8, "V": 5, "6": 6,
        "J": 1, "W": 6, "7": 7,
        "K": 2, "X": 7, "8": 8,
        "9": 9, "0": 0, "U": 4,
    ]
    
}
