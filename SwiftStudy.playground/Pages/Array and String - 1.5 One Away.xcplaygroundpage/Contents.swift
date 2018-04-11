/*:
  There are three types of characeter edits on strings: insert, replace, or delete "A" single character.
 Write a function to return if one string is 0 or 1 edit away from the other
 
 1. A==B , all match. return true ( 0 edit )
 2. characters count has more than one (>1) difference. return false
 
 After Step 2. Only need to verfiy two cases
 - First, A and B have same length
 - Second, A and B have ONLY one single character count difference.
 
 - Same length strings: replace the Only missmatch character. The possible one away pattern to
 
 - Now start to apply ONE insert on ShorterString, or One delete to LongerString or One replace at same length string and check if two can be equaled.
 
 
 */

import Foundation

func checkOneAway(stringA:String,stringB:String) -> Bool {
    
    guard stringA != stringB else {return true}
    guard (stringA.count==stringB.count || stringA.count-stringB.count==1 || stringB.count-stringA.count==1) else {return false}
    
    //after this point, the A/B strings can only have upto 1 difference in character counts.
    
    // after this point, there is only upto one mismatched character.
    
    // one remove: at longString
    // one insert:at shortString
    
    var miss = 0
    var arrayA = [Character]()
    var arrayB = [Character]()

    for char in stringA {arrayA.append(char)}
    for char in stringB {arrayB.append(char)}


    /*
     ==========   one replace: at one of two same length string
     Since here two strings are same length. So it only allow one mismatch to be one away from each other.
     - conver to array to to have Int index
    */
    if  stringA.count == stringB.count {
        
        print("one replace!",stringA,stringB,arrayA,arrayB)
        for i in 0...stringA.count-1 {
            if arrayA[i] != arrayB[i] {
                print("one replace: mismatch at \(i)")
                if miss != 0 {return false}
                miss+=1
            } else {print("one replace: match at \(i)")}
        }
        return true
    }
    
 /*
   =============   One remove or One insert:
     One remove at longArray equals to One insert at shortArray. just need to meet one of two. Here I generate the possible pattern that is one remove away from longString. if the shortString matching one of them, it's one away.
 
    
     remove One single character from longString by using .remove(at:index).
     A longString has N characters will have N possible shortString to be one away from longString.
     abc will have three possible pattern : bc,ac,ab as One remove away from abc.
     So ca won't be one remove away from abc

 */
    if stringA.count-stringB.count==1 || stringB.count-stringA.count==1 {
        
        let (longString,shortString) = stringA.count >= stringB.count ? (stringA,stringB):(stringB,stringA)

        for char in longString {
            var removeOneString = longString
            removeOneString.remove(at:longString.index(of: char)!)
            
            print(longString,removeOneString, shortString)
            if shortString == removeOneString {
                print("matching after removing one Char: \(char)")
                return true
            }
        }
    }
    return false
}

// bc and cb are false, you can only have one Edit.Swapping are two Edit.
checkOneAway(stringA: "bc", stringB: "bb")
checkOneAway(stringA: "abc", stringB: "a c")
//abc and cba are false
checkOneAway(stringA: "abc", stringB: "cba")



//abc and cb are false
checkOneAway(stringA: "abcd", stringB: "bcd")
checkOneAway(stringA: "abcd", stringB: "adc")

//adc and ac are true
checkOneAway(stringA: "adc", stringB: "ac")
checkOneAway(stringA: "pale", stringB: "ple")


/*
=====================         ===================
 one Edit means: YOU CAN ONLY Have one difference of Character.
 - one insert/remove:
 after Insert/Remove ONE character, stringA = stringB
 
 - one replace :
 replace ONE character, stringA = stringB

 adc,ac : one remove
 abc,ac : one insert
 ac,bc : one replace (same length of strings)
 
 
*/


