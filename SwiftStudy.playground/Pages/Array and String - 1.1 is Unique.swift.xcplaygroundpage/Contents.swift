import Foundation


/*
 
 ==============   use index of string =====================
1. String is a array of Characters. string/array/set all have .contains()
2. for string, use string.index(of:) to read out String index
2. String is an array of CHaracters, similar to array iteration.
 for (index,value) in string

 */
func checkUniqueByString(inputString:String) -> Bool {
    var stringIn = inputString
    for char in stringIn {
        stringIn.remove(at:stringIn.index(of: char)!)
        if stringIn.contains(char) {return false}
    }
    return true
}
checkUniqueByString(inputString: "abccd")


func checkUniqueBySort(inputString:String) -> Bool {
    var stringIn  = inputString.sorted()
    
    for (index,char) in stringIn.enumerated() {
        print("\(stringIn.endIndex)")
        guard index < stringIn.endIndex-1 else {return true}
        if char == stringIn[index+1] {
            print("\(char) at \(index) hit \(stringIn[index+1]) at \(index+1)")
            return false
        }
        
//        let successiveIndex = stringIn.index(stringIn.index(of: char)!, offsetBy: 1)
//        if char == stringIn[successiveIndex]  {
//            return false
//        }
    }
    return true
}

checkUniqueBySort(inputString: "abcdefga")


/*
 ============= convert to Dictionary =====================

var stringDic = [String:Int]()
stringDic["a"] = 0
stringDic.count
stringDic["a"] = 1

1. init a Dictionary of Characters with default Nil value
2. iterate String
3 if Dic has non nil during iteration, value has been written. Flag duplicate (false ). otherwise, store "0 value

 */

func checkUniqueByDic(inputString: String) -> Bool{
    var stringIn = inputString
    var characterDic = [Character:Int]()
    print(characterDic)
    for char in stringIn {
        print("characterDic = \(characterDic)")
        print(char)
        if characterDic[char] != nil {
            print("catch duplicate")
            return false
        }
        characterDic[char] = 0
    }
    print("characterDic = \(characterDic)")
    return true
}

checkUniqueByDic(inputString: "abcd")


/*
 =================  conver to array =========================
 
 1. array iterations:
 for (index,value) in array.enumberated() {}
 
 2. for Loop in range
 for i in start...end , start...<end
 
 3. array.endIndex is the index After the last element.
 
 */
 
 
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

checkUnique(inputString: "dcbaC")



/*

 ==================    convert to set  =====================
 
 1. initialize a Set of characters : Set<Character>()
 2. .insert(element) and .remove(element)

 */

func checkUniqueBySet(inputString:String) -> Bool {
    var charactorsSet = Set<Character>()
    for char in inputString {
        if charactorsSet.contains(char) {return false}
        charactorsSet.insert(char)
    }
    return true
}
checkUniqueBySet(inputString: "abcdd")


/*
=========================  Bits ==========================
 
 
 
 
 */



