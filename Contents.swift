import UIKit

let sowpods: [String] = []

// Q1 What are all of the words containing UU?
func findWordsContainingUU() -> [String] {
    var wordsArray: [String] = [] //Empty String array to group words with UU and return.
    for word in sowpods {
        if word.contains("UU") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}//using the array and for loop gives us an easier way to extarct the words containing UU.
//If sowpods was not an array, we would have to make it one first using swopods.components(separatedBy:)
//Could also use let filteredArray = stringArray.filter { $0.contains("uu") } as an alternative to a for loop.


// Q2 What are all of the words containing an X and a Y and a Z?
func findWordsContainingXYZ() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.contains("X"), word.contains("Y"), word.contains("Z") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q3 What are all of the words containing a Q but not a U?
func findWordsWithQButNotU() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.contains("Q"), !word.contains("U") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q4 What are all of the words that contain the word CAT and are exactly 5 letters long?
func findFiveLetterCatWords() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.count == 5, word.contains("CAT") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q5 What are all of the words that have no E or A and are at least 15 letters long?
func findFifteenLetterLongEorAWords() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.count >= 15, !word.contains("E"), !word.contains("A") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}


// Q6 What are all of the words that have a B and an X and are less than 5 letters long?
func findBandXWordsLessThanFiveLetters() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.count < 5, word.contains("B"), word.contains("X") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q7 What are all of the words that both start and end with a Y?
func findWordsThatStartAndEndWithY() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.starts(with: "Y"), word.hasSuffix("Y") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q8 What are all of the words with no vowel and not even a Y?
func findWordsWithNoVowels() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if !word.contains("A"), !word.contains("E"), !word.contains("I"), !word.contains("O"), !word.contains("U"), !word.contains("Y") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q9 What are all of the words that have all 5 vowels, in any order?
func findWordsWithAllFiveVowels() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.contains("A"), word.contains("E"), word.contains("I"), word.contains("O"), word.contains("U") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q10 What are all of the words that have all 5 vowels, in alphabetical order?

// I used helper methods and enums, which i'm not great with - so I wanted to test it.
// Thats why the swopods2 array has 5 strings below.
let sowpods2: [String] = ["Apple", "Eat", "absteinous", "Adventitious", "Puppy"]
findWordsWithVowelsAlphabetically()

func findWordsWithVowelsAlphabetically() -> [String] {
    sowpods2.filter { ScrabbleHelper.containsAllVowels(word: $0) && ScrabbleHelper.areVowelsInAlphaOrder(word: $0) }
}

//helper func
enum ScrabbleHelper {
    
    static func areVowelsInAlphaOrder(word: String) -> Bool {
        let lowercaseWord = word.lowercased()
        let letters = Array(lowercaseWord)
        let vowelLetters = letters.filter { Self.containsVowel($0) }
        let orderedVowels = vowelLetters.sorted()
        return vowelLetters == orderedVowels
    }
    
    
        static func containsAllVowels(word: String) -> Bool{
            let lowerCaseWord = word.lowercased()
            return lowerCaseWord.contains("a") && lowerCaseWord.contains("e") && lowerCaseWord.contains("i") && lowerCaseWord.contains("o") && lowerCaseWord.contains("u")
            
        }
        
    static func containsVowel (_ character: Character) -> Bool {
            let lowerCaseCharacter = character.lowercased()
            return lowerCaseCharacter == "a" || lowerCaseCharacter == "e" || lowerCaseCharacter == "i" || lowerCaseCharacter == "o" || lowerCaseCharacter == "u"
            
        }

}

// Q11 How many words contain the substring "TYPE”?
func findWordsContainingType() -> [String] {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.contains("TYPE") {
            wordsArray.append(word)
        }
    }
    return wordsArray
}

// Q12 Create and print an array containing all of the words that end in "GHTLY"
func findWordsEndingInGHTLY() {
    var wordsArray: [String] = []
    for word in sowpods {
        if word.hasSuffix("GHTLY") {
            wordsArray.append(word)
        }
    }
    print(wordsArray)
}

// Q13 What is the shortest word that contains all 5 vowels?
func findShortestWordContainingAllVowels() -> String {
    var wordsWithVowels: [String] = []
    var shortestWord = ""
    var index = 0

    for word in sowpods {
        if word.contains("A"), word.contains("E"), word.contains("I"), word.contains("O"), word.contains("U") {
            wordsWithVowels.append(word)
        } //Pull words that have all 5 vowels
    }
    
    while index < wordsWithVowels.count  {
            if shortestWord.count == 0 {
                shortestWord = wordsWithVowels[index]
                index += 1
            } //start loop at 0 and iterate through wordsWithVowels until a match- to increasing index, is found.
            
            if wordsWithVowels[index].count < shortestWord.count {
                shortestWord = wordsWithVowels[index]
                //keep replacing shortest word with shorter word from WWV array.
            }
        }//once a word with all vowels is less than shortest word, we have a winner.

return shortestWord
}


// Q14 What is the longest word that contains no vowels?
func findLongestWordWithNoVowels() -> String {
    var wordsWithNoVowels: [String] = []
    var index = 0
    var longestWord = ""
    
    for word in sowpods {
        if !word.contains("A"), !word.contains("E"), !word.contains("I"), !word.contains("O"), !word.contains("U"), !word.contains("Y") {
            wordsWithNoVowels.append(word)
        }
    }//find words with no vowels and add to array.

    while index < wordsWithNoVowels.count {
        if longestWord.count == 0 {
            longestWord = wordsWithNoVowels[index]
            //start loop with first word in wordsWithNoVowels array.
            index += 1
        }
        if wordsWithNoVowels[index].count > longestWord.count {
            
            longestWord = wordsWithNoVowels[index]
            //keep replacing longest word with longer word from array until largest is found.
        }
    }
    return longestWord
}

// Q15 Which of the letters Q, X, and Z is the least common?
func findLeastCommonOfQXZ() -> String {
    var qCount = 0
    var xCount = 0
    var zCount = 0
    var leastCommonLetterWinner = ""

    for word in sowpods {
        for char in word {
            if char == "Q" {
                qCount += 1
            } else if char == "X" {
                xCount += 1
            } else if char == "Z" {
                zCount += 1
            }
        }
    }

    if qCount > xCount, qCount > zCount {
        //can I write this q> xC, zC?
        leastCommonLetterWinner = "Q"
    } else if xCount > qCount, xCount > zCount {
        leastCommonLetterWinner = "X"
    } else if zCount > qCount, zCount > xCount {
        leastCommonLetterWinner = "Z"
    }
    return leastCommonLetterWinner
}

// Q16 What is the longest palindrome?


//Find Palindrome Try 1
//func isPalindrome(word: String) -> Bool {
//    var index = 0
//
//    while index < word.count / 2 {
//        if word[word.index(word.startIndex, offsetBy: 0)] == word[word.index(word.endIndex, offsetBy: -1)] {
//
//            index += 1
//        } else {
//            return false
//        }
//    }
//        if word[index] != word.count - 1 {
//            return false
//        }
//        index += 1
//    }
////  cycle through index, from 0, and check against last letter (and previous) to determine palindrome.
//    return true
//}


//Find Palendrome Try 2
func isPalindrome(inputString: String) -> Bool {
    let stringLength = inputString.count
    var position = 0
    
    while position < stringLength / 2 {
        let startIndex = inputString.index(inputString.startIndex, offsetBy: position)
        let endIndex = inputString.index(inputString.endIndex, offsetBy: -position - 1)
        
        if inputString[startIndex] == inputString[endIndex] {
            position += 1
        } else {
            return false
        }
    }
    
    return true
}

func findLogestPalindrome() -> String {
    var palindromes: [String] = []
    var index = 0
    var longestPalindrome = ""

    for word in sowpods {
        if isPalindrome(inputString: word) {
            palindromes.append(word)
        }
    }

    while index < palindromes.count {
        if palindromes[index] > palindromes[index + 1] {
            longestPalindrome = palindromes[index]
            index += 1
            //comparing each palindorme agains eachother using increasing index.
            //When One palindrom is longer it replaces var longestP until loop is complete.
        } else {
            longestPalindrome = palindromes[index + 1]
            index += 1
            //I used same basic format for shortest and longest questions previously.
        }
    }

    return longestPalindrome
}

//Q17
// What are all of the letters that never appear consecutively
// in an English word? For example, we know that “U” isn’t an answer,
// because of the word VACUUM, and we know that “A” isn’t an answer,
// because of “AARDVARK”, but which letters never appear consecutively?

let sowPods = Array(arrayLiteral: "vacuum", "oregon", "aardvark")

func checkForDoubledLetters(words: [String]) -> [Character] {
    
    var alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    var doubledLetters = [String]()
    var index = 0

    while index < words.count {
        var word = Array(words[index])
        for char in word {
            if char == word[index + 1] {
                doubledLetters.append(String(char))
            }
        }
        index += 1
    }

    var nonDoubledLetters = alphabet.filter { !doubledLetters.contains(String($0)) }
    print(doubledLetters)
    return nonDoubledLetters
    
}
