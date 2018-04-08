import Foundation

// 1.2  check if a string is a permutation of another

func checkPermutation(_ inputStringA:String,_ inputStringB:String) -> Bool {
    
    print(inputStringA,inputStringB)
    for char in inputStringA {
        guard inputStringB.contains(char) else {
            return false
        }
    }
    return true
}

checkPermutation("test","estt")

