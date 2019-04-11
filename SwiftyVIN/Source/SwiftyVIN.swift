//
//  SwiftyVIN.swift
//  SwiftyVIN
//
//  Created by Majd Sabah on 10/7/18.
//  Copyright © 2018 Majd Sabah. All rights reserved.
//

import Foundation

public struct SwiftyVIN {
    
    private(set) var vinString: String
    
    public init(_ vinString: String) {
        
        self.vinString = vinString.uppercased()
        
    }
    
    
    /// Check validation
    ///
    /// Validation steps:
    /// - Validate vin length
    /// - Validate vin to not contains I, O and Q
    /// - Validate vin to not contains U, Z and 0 at tenth char index
    /// - Validate vin check digit
    /// - Validate vin repeated characters
    ///
    /// - Returns: a flag 'true' or 'false' based on validations
    public func isValid() -> Bool {
        
        if !SwiftyVIN.validVINLength(vinString) {
            
            if SwiftyVINLogger.shared.debugMode {
               print("InvalidVINLength")
            }
            
            return false
            
        }
        
        if !SwiftyVIN.validVINCharacters(vinString) {
            
            if SwiftyVINLogger.shared.debugMode {
                print("InvalidVINCharacters")
            }
            
            return false
            
        }
        
        if !SwiftyVIN.validVINCharacter(vinString, at: VINConstants.tenthCharIndex) {
            
            if SwiftyVINLogger.shared.debugMode {
                print("InvalidVINCharacterAtTenthChar")
            }
            
            return false
            
        }
        
        if !SwiftyVIN.validVINCheckDigit(vinString) {
            
            if SwiftyVINLogger.shared.debugMode {
                print("InvalidVINCheckDigit")
            }
            
            return false
            
        }
        
        if !SwiftyVIN.validVINRepeatedCharacters(vinString) {
            
            if SwiftyVINLogger.shared.debugMode {
                print("InvalidVINRepeatedCharacters")
            }
            
            return false
            
        }
        
        return true
        
    }
    
    
    /// For model years 1981 to present, the VIN is composed of 17 alphanumeric values
    ///
    /// - Parameter vinString: vin string
    /// - Returns: a flag 'true' when valid, else returns 'false'
    internal static func validVINLength(_ vinString: String) -> Bool {
        
        if vinString.count < VINConstants.vinMaxLength || vinString.count != VINConstants.vinMaxLength {
            
            return false
            
        }
        
        return true
        
    }
    
    
    /// The letters I,O, Q are prohibited from any VIN position, also special characters are prohibited
    ///
    /// - Parameter vinString: vin string
    /// - Returns: a flag 'true' when valid, else returns 'false'
    internal static func validVINCharacters(_ vinString: String) -> Bool {
        
        if !VINConstants.prohibitedCharacters.isDisjoint(with: vinString) {
            
            return false
            
        }
		
		if vinString.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
			
			return false
			
		}
        
        return true
        
    }
    
    
    /// The index position of the VIN represents the Model Year and
    /// does not permit the use of the characters U and Z, as well
    /// as the numeric zero (0)
    ///
    /// - Parameters:
    ///   - vinString: vin string
    ///   - index: the index position in of the VIN
    /// - Returns: a flag 'true' when valid, else returns 'false'
    internal static func validVINCharacter(_ vinString: String, at index: Int) -> Bool {
        
        if !VINConstants.prohibitedTenthCharacters.isDisjoint(with: String(vinString[index])) {
            
            return false
            
        }
        
        return true
        
    }
    
    
    /// The ninth position of the VIN is a calculated value based on
    /// the other 16 alphanumeric values, it's called the
    /// "Check Digit". The result of the check digit can ONLY be a
    /// numeric 0-9 or letter "X" in case of 10.
    ///
    /// - Parameter vinString: vin string
    /// - Returns: a flag 'true' when valid, else returns 'false'
    internal static func validVINCheckDigit(_ vinString: String) -> Bool {
        
        var totalWeightTranslation: Int = VINConstants.zeroSum
        
        for (index, char) in vinString.enumerated() {
            
            totalWeightTranslation += (VINConstants.vinWeights[index] * VINConstants.vinTranslations[String(char)]!)
            
        }
        
        let checkDigit = totalWeightTranslation % VINConstants.divisor
        let ninthChar: String = String(vinString[VINConstants.ninthCharIndex])
        
        if checkDigit == VINConstants.ten {
            
            if ninthChar != VINConstants.stringX {
                return false
            }
            
        } else if ninthChar != String(checkDigit) {
            
            return false
            
        }
        
        return true
        
    }
    
    
    /// Custom checking on repeated characters,
    /// vin constains only one character repeated 1, 2... 9 should not be valid
    /// 11111111111111111 is not valid
    ///
    /// * Need more enhance
    ///
    /// - Parameter vinString: vin string
    /// - Returns: a flag 'true' when valid, else returns 'false'
    internal static func validVINRepeatedCharacters(_ vinString: String) -> Bool {
        
        let firstChar: String = vinString[0]
        
        for (_, char) in vinString.enumerated() {
            
            if firstChar != String(char) {
                
                return true
                
            }
            
        }
        
        return false
        
    }
    
}
