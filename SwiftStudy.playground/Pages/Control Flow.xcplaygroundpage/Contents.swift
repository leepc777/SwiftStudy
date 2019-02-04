import Foundation

/* ==========  Control transfer Statement

 Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:
 • continue
 • break
 • fallthrough
 • return
 • throw


*/

/*
 The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop. It says “I am done with the current loop iteration” without leaving the loop altogether.

 
*/

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput {
    if charactersToRemove.contains(character) {
//        continue // stop here and move to next iteration of loop
        break  // break the whole loop
    } else {
        puzzleOutput.append(character)
    }
    print("\(character) is not in removing list")
}
print(puzzleOutput)
// Prints "grtmndsthnklk"


let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?

switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."




/*
 
 While Loops
 A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations is not known before the first iteration begins. Swift provides two kinds of while loops:
 
 while evaluates its condition at the start of each pass through the loop.
 
 repeat-while evaluates its condition at the end of each pass through the loop.
 
 while condition {
 statements
 }
 
 repeat {
 statements
 } while condition
 
*/
