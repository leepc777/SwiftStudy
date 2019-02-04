
/*:
 1.6 Implement basic string compression using the counts of repeated characters.
 If the compressed string is not smaller than the original, return the original.
 You can assume the string has only characters a-z \
 `aabcccccaaa -> a2b1c5a3`

  */



/*
 ============ Use Dic
 - Dic doesn't have order !
 

*/


import Foundation

// this is wrong. compressString didn't get updated when looping inputString
func stringCompress(inputString:String) -> String {
    var compressedString = String()
    var countDic = [Character:Int]()
//    coutDic["a"] = 0
//    coutDic["b"] = 1
    print(countDic)
    for char in inputString {
        if compressedString.contains(char) {
            countDic[char] = countDic[char]! + 1
        } else {countDic[char] = 0}
    }
    
    //
    for (key,value) in countDic {
        compressedString = compressedString+String(key)+String(value)
    }
    return compressedString
}

stringCompress(inputString: "hello! word!")
stringCompress(inputString: "aabcccccaaa")



//=======================
// this one has bug, it didn't work right when taking "a" as input
// and it doesn't count the last characters , because here it only store when mismatchs happen.
func compressString(inputString:String) -> String {
//    inputString.trimmingCharacters(in: .whitespacesAndNewlines)
    var preChar:Character = " "
    var count = 0
    var compressedString = String()
    for char in inputString {
        if char == preChar {
            count+=1
            if char == inputString.last {compressedString=compressedString+String(preChar)+String(count)}
        } else { //mismatch, but store before overwriting
            if preChar != " " { compressedString=compressedString+String(preChar)+String(count) }
            preChar=char
            count=1
        }
    }
    return compressedString.count < inputString.count ? compressedString:inputString
}

print(compressString(inputString:"abcddaaaaaa"))
print(compressString(inputString: "aabccccc                aaa"))


//================== fix the bug ================
//  I still store to new string when not matching. So the last same characters have to cancaternate the count outside iteration
func compressStringFix(inputString:String) -> String {
    
    var preChar:Character = inputString.first!
//    var compressedString = "inputString[inputString.startIndex]"
    var compressedString = String(inputString[inputString.startIndex])
    var count = 1
    for char in inputString.dropLast() {
        if char == compressedString.last {
            count+=1
        } else {
            compressedString+="\(count)"+"\(char)"
            count = 1
        }
    }
    
    //this is for the last same characters at the end of string
    if count > 1 {compressedString += String(count)}
    
    return compressedString.count < inputString.count ? compressedString:inputString
}

print(compressStringFix(inputString:"abcddaaaaaa"))
print(compressStringFix(inputString: "aabccccc                aaa"))




// this also fail
func compressString0(inputString:String?) -> String {
    inputString?.trimmingCharacters(in: .whitespacesAndNewlines)
    guard inputString != nil else{return "can't accept NIL"}
    var preChar:Character = inputString!.first!
    var count = 1
    var compressedString = String()
    for char in inputString! {
        if char == preChar {
            count+=1
        } else { //mismatch, but store before overwriting
            if preChar != " " { compressedString=compressedString+String(preChar)+String(count) }
            preChar=char
            count=1
        }
    }
    return compressedString.count < inputString!.count ? compressedString:inputString!
}

print(compressString0(inputString: "abcddaa aa aa"))


print(" =========  MY Naive Compression ========== ")

extension String {
    func myNaiveCompress() -> String {
        var dic = [Character:Int]()
        var result = String()
        
        for c in self {
            if dic.keys.contains(c) {
                dic[c] = dic[c]!+1
            } else {
                dic[c] = 1
            }
        }
        
        for (k,v) in dic{
            result.append(k)
            result.append(String(v))
        }
        return result
    }
}

var testString = "abcddaa* aa aa"
testString.myNaiveCompress()

print("==========  use set ============= ")
extension String {
    func naiveCompress() -> String {
        var newString=String()
//        let aSet:Set<String> = []
//        let aSet = Set<String>()
        let aSet = Set(self)
        
        for c in aSet {
            
            var count = 0
            for character in self {
                if character == c {count=count+1}
            }
            newString.append(c)
            newString.append("\(count)")
        }
        
    return newString
    }
}

testString.naiveCompress() // the count is correct but set does not have fixed order

let aa = testString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
print(aa)

testString.trimmingCharacters(in: CharacterSet.punctuationCharacters)
testString.trimmingCharacters(in: CharacterSet.alphanumerics)

