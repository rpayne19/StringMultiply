//
//  StringMultiply.swift
//  StringMultiply
//
//  Created by Rob on 5/5/18.
//  Copyright © 2018 Rob. All rights reserved.
//

import Foundation

class StringMultiply {
    
    static func multiply(_ num1: String, _ num2: String) ->  String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        var outputString = ""
        var numArray1 = Array(num1)
        var numArray2 = Array(num2)
        var resultArray = Array(repeatElement(0, count: numArray1.count + numArray2.count))
        var i = numArray1.count - 1
        while i >= 0 {
            let iOffset = numArray1.count - 1 - i
            var j = numArray2.count - 1
            
            while j >= 0 {
                let jOffset = numArray2.count - 1 - j
                resultArray[iOffset + jOffset] += multiplyTwoChars(numArray1[i], numArray2[j])
                j -= 1
            }
            i -= 1
        }
        
        for i in 1..<resultArray.count {
            resultArray[i] += resultArray[i - 1] / 10
            resultArray[i - 1] %= 10
        }
        while resultArray.count > 0 {
            let lastDigit = resultArray.removeLast()
            outputString.append(lastDigit == 0 ? "0" : String(lastDigit))
        }
        while outputString.first == "0" {
            outputString.removeFirst()
        }
        
        return outputString
    }
    
    private static func multiplyTwoChars(_ num1: Character, _ num2: Character) -> Int {
        return Int(String(num1))! * Int(String(num2))!
    }
}
