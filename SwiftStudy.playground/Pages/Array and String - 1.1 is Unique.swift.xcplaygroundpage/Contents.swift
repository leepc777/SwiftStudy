//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


func checkUnique(inputString:String) -> Bool {
    var charactorsArray = [Character]() //array of characters
    for i in inputString {  // i is an character
        charactorsArray.append(i)
    }
    for (index,value) in charactorsArray.enumerated() {
        print("index and value of CharactorArray", index, value)
        for indexNew in index+1..<charactorsArray.endIndex {
            if value == charactorsArray[indexNew] {
                print("\(value) hit the same character at index : \(indexNew), no unique")
                return false
            } else {print("\(value) not hit the same character at index : \(indexNew)")}
        }
    }
    return true
}

checkUnique(inputString: "dcba")
