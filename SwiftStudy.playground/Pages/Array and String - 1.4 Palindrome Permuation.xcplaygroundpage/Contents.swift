
/*
 
 1.4 Check if a string is a permutation of a palindrome

 pal·in·drome
 ˈpalənˌdrōm
 noun
 a word, phrase, or sequence that reads the same backward as forward, e.g., madam or nurses run.
 
 
 - (IntIndex,value) in String.enumerated() : use Int index is much easier
 - string[string.index(.startIndex,offsetBy:Int)] : string.index return index , string[index] return Char
 - use .index(offsetBy) to read out mirror Character
   for example, [0,1,2,3] index 3 is morror to index 0.
 starting index offset by 3 (you can say the distance from index 0 is 3) ,
  offSet to starting index = array.count - current index - 1
 index 1 is morror to index2 which is offset by 2(=4-1-1) from starting index 0.
 */

import Foundation

func checkPalindrome(string:String) -> Bool {
    
    let noSpaceString=removeSpace(string: string)
    let charCount = noSpaceString.count
    for (index,char) in noSpaceString.enumerated() {
        let mirrorChar = noSpaceString[noSpaceString.index(noSpaceString.startIndex, offsetBy: noSpaceString.count-1-index)]
        print("charCount:\(charCount) index:\(index) char:\(char) mirrorChar:\(mirrorChar)")
        
        if char != mirrorChar {return false}
    }
    return true
}

func removeSpace(string:String) -> String {
    let trimString = string.trimmingCharacters(in: .whitespacesAndNewlines)
    var newString = String()
    for char in trimString where char != " " {
        newString.append(String(char))
    }
    return newString
}

checkPalindrome(string: "nurses run")
checkPalindrome(string: "ab a")
checkPalindrome(string: "accba")



