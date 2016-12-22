import Foundation
// ******** PRACTICE WITH STRINGS ******** \\

// 1. Find the first non-repeated character in a String


// 2. Reverse a String iteratively and recursively

// iterative
func reverseIteratively(str: String) -> String {
    var reversed = String()
    for char in str.characters {
        reversed.insert(char, at: reversed.startIndex)
    }
    
    return reversed
}

reverseIteratively(str: "Hello, this is a reversed string!")

// recursive
func reverseRecursively(str: String) -> String {
    
    var reversed = String()
    var remainingLetters = str
    
    if remainingLetters.characters.count > 1 {
        let first = remainingLetters.characters.popFirst()!
        let last = remainingLetters.characters.popLast()!
        
        remainingLetters = reverseRecursively(str: remainingLetters)
        
        reversed = "\(last)\(remainingLetters)\(first)"
        
        
    } else if remainingLetters.characters.count == 1 {
        reversed = remainingLetters
    }
    
    return reversed
}

reverseRecursively(str: "Puppies make me happy!")

// alternate recursive solution
//func reverseRecursively(str: String) -> String {
//
//    var result = ""
//
//    if str.characters.count > 0 {
//
//        let firstChar = str.characters.first!
//        let charsWithoutFirstChar = str[str.characters.index(after: str.characters.startIndex)..<str.characters.endIndex]
//        result = "\(reverseRecursively(str:charsWithoutFirstChar))\(firstChar)"
//        print(result)
//    }
//
//    return result
//}
//
//reverseRecursively(str: "Hello")


// 3. Determine if 2 Strings are anagrams


// 4. Check if String is a palindrome


// 5. Check if a String is composed of all unique characters


// 6. Determine if a String is an int or a double


// 7. HARD: Find the shortest palindrome in a String


// 8. HARD: Print all permutations of a String


// 9. HARD: Given a single-line text String and a maximum width value, write the function 'String justify(String text, int maxWidth)' that formats the input text using full-justification, i.e., extra spaces on each line are equally distributed between the words; the first word on each line is flushed left and the last word on each line is flushed right





