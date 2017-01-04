import Foundation
// ******** PRACTICE WITH STRINGS ******** \\

// 1. Find the first non-repeated character in a String
let testString = "kookaburra"

func firstDistinctChar(word: String) -> String {
    
    var distinctChar = String()
    var commonChar = [String]()
    
    for (i, char) in word.characters.enumerated() {
        for j in (i+1)...(word.characters.count-1) {
            if char == word[word.characters.index(word.startIndex, offsetBy: j)] {
                commonChar.append(String(char))
            } else if !commonChar.contains(String(char)) && j == word.characters.count-1 {
                distinctChar = String(char)
                return distinctChar
            }
        }
    }
    
    return distinctChar
}

// print(firstDistinctChar(word: testString))

//RECURSIVE SOLUTION
let test = "p,ops"
var findingDistinctChar = true
var distinctChar = String()
//need to set these outside of function b/c they are continuously being reset when the function is called recursively

func firstDistinctCharRecursive(word: String) -> String {
    
    let noDistinctChar = "There are no distinct characters found in \(word)"
    var wordWithoutSpaces = word.replacingOccurrences(of: " ", with: "")
    
    if findingDistinctChar == true && wordWithoutSpaces.characters.count > 0 {
        
        let char = wordWithoutSpaces.characters.first!
        var remainingChar = wordWithoutSpaces[wordWithoutSpaces.characters.index(after: wordWithoutSpaces.characters.startIndex)..<wordWithoutSpaces.characters.endIndex]
        
        if remainingChar.characters.contains(char) {
            remainingChar = remainingChar.replacingOccurrences(of: String(char), with: "")
            firstDistinctCharRecursive(word: remainingChar)
        } else {
            findingDistinctChar == false
            distinctChar = String(char)
        }
    }
    
    if distinctChar.characters.count > 0 {
        return distinctChar
    } else {
        return noDistinctChar
    }

}

//print(firstDistinctCharRecursive(word: test))


// -------------------------------------------------------------------------------
// 2. Reverse a String iteratively and recursively

// iterative
func reverseIteratively(str: String) -> String {
    var reversed = String()
    for char in str.characters {
        reversed.insert(char, at: reversed.startIndex)
    }
    
    return reversed
}

//reverseIteratively(str: "Hello, this is a reversed string!")

// recursive
func reverseRecursively(str: String) -> String {
    
    var reversed = String()
    var remainingLetters = str
    
    if remainingLetters.characters.count > 1 {
        let first = remainingLetters.characters.popFirst()!
        let last = remainingLetters.characters.popLast()!
        
        remainingLetters = reverseRecursively(str: remainingLetters)
        
        reversed = "\(last)\(remainingLetters)\(first)"
        print("current word: \(str), reversed: \(reversed), remaining: \(remainingLetters)")
        
        
    } else if remainingLetters.characters.count == 1 {
        reversed = remainingLetters
    }
    
    return reversed
}

// reverseRecursively(str: "Puppies make me happy!")

/* alternate recursive solution
 func reverseRecursively(str: String) -> String {

    var result = ""

    if str.characters.count > 0 {

        let firstChar = str.characters.first!
        let charsWithoutFirstChar = str[str.characters.index(after: str.characters.startIndex)..<str.characters.endIndex]
        result = "\(reverseRecursively(str:charsWithoutFirstChar))\(firstChar)"
        print(result)
    }

    return result
}

reverseRecursively(str: "Hello") */



// ------------------------------------------------------------------------------
// 3. Determine if 2 Strings are anagrams

func isAnagram(string1: String, string2: String) -> Bool {
    
    //length has to be the same
    //share all common letters
    
    var testString = Array(string2.characters)
    var commonChar = [String]()
    
    if string1.characters.count == string2.characters.count {
        for char in string1.characters {
            if testString.contains(char) {
                commonChar.append(String(char))
                testString.remove(at: testString.index(of: char)!)
            }
        }
        
        if commonChar.count == string2.characters.count {
            print("yes, \(string1) and \(string2) are anagrams")
            return true
        }
    }
    
    return false
}

//isAnagram(string1: "pusheen", string2: "")

func isAnagramRecursive(string1: String, string2: String) -> Bool {
    
    //second string will be reduced and tested for common characters with string 1
    var string1Copy = string1
    var string2Copy = string2
    
    if string1.characters.count == 0 && string2.characters.count == 0 {
        return true
    } else {
        let string1Char = string1Copy.characters.popFirst()!
        
        if string2Copy.characters.contains(string1Char) {
            string2Copy.remove(at: string2Copy.characters.index(of: string1Char)!)
            if isAnagramRecursive(string1: string1Copy, string2: string2Copy) {
                return true
            }
        }
    }
    
    return false
}

isAnagramRecursive(string1: "taco", string2: "cato")

// 4. Check if String is a palindrome


// 5. Check if a String is composed of all unique characters


// 6. Determine if a String is an int or a double


// 7. HARD: Find the shortest palindrome in a String


// 8. HARD: Print all permutations of a String


// 9. HARD: Given a single-line text String and a maximum width value, write the function 'String justify(String text, int maxWidth)' that formats the input text using full-justification, i.e., extra spaces on each line are equally distributed between the words; the first word on each line is flushed left and the last word on each line is flushed right





