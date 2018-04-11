
/*
 =======    Replace spaces in a string with 20%

 1. only replace the spaces inside string, not the spaces before/after string
 so " abcd " should be "abcd"
 2. all consecutive spaces count as one space
 
Trim characters by using built in method trimmingCharacters.
This will remove the spaces before and after string
 trimString=inputString.trimmingCharacters(in: .whitespacesAndNewlines)

 

*/

import Foundation

func replaceSpaces(inputString:String) -> String {
    var trimString = String()
    var newString = String()
    var hitSpace = Int()
    trimString=inputString.trimmingCharacters(in: .whitespacesAndNewlines)
    print("after trimmingCharacters:\(trimString)")
    for char in trimString {
        if (char == " " && hitSpace == 0) {
            hitSpace+=1
            print("hit. it's \(char)")
            newString=newString+"20%"
        }
        if (char == " " && hitSpace != 0) {
            hitSpace+=1
            print("\(hitSpace)hit. but it's not the 1st space")
        }
        else {
            hitSpace = 0
            newString = newString+String(char)
        }
    }
    return newString
}

print(replaceSpaces(inputString:"   can you replace the   spaces with    ?"))



/*
=============================================
 this is more complicated way to do it.
 just for study purpose.
 
 - try to use indice
 - itration plus where condition {}
 
 for char in string where conditon {}
 
 - ternary operators
 value = condition ? valueIfTrue:valueIfFalse
 
 - .replaceSubrange()
 

*/

func replaceSpacesByTernary(inputString:String) -> String {
    
    var s = ""
    for c in inputString {
//        s += c == " " ? "%20" : String(c)
        s = s+(c==" " ? "%20" : String(c))
    }
    return s
}
print(replaceSpacesByTernary(inputString:"   can you replace the   spaces with    ?"))


func replaceSpacesByIndice(inputString:String) -> String {
    var trimString = inputString.trimmingCharacters(in: .whitespacesAndNewlines)
    for index in trimString.indices where trimString[index] == " " {
        trimString.replaceSubrange(index...index, with: "%")
    }
    return "test"
}

 
