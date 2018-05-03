/*
 
 An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.
 
 - modulus(mod) operator, remainder operator ( % ) %2, modulus two
*/

import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


var optionalNumbver0 : Optional<Int> = 10
var optionalNumber : Int? = 11

// two checks go in order down the line. The first thing going to check is to make sure optional numbver has a value and if it does. it is going to assign it to a oddnumber.
if let oddNumber = optionalNumber, oddNumber % 2 != 0 {
    print(oddNumber)
}


//let urlString = "https://avatars1.githubusercontent.com/u/31022950?s=400&u=bd35ddb6e9652b5d15058fa25ff05233a81e9553&v=4"

let urlString = "https://d17h27t6h515a5.cloudfront.net/topher/2017/November/59fe5127_whale/whale.jpg"
let wrongURL = ""

/*
all these 3 condition have to be satisfied before we going to this block

 how to download images ?
 
 1. get the URL for the image
 let url = URL(string:) //URL may return an Nil. So url is an optional
 
 2. obtain the NSData with the image
 let imgData = Data(contentsOf:url!) // Data() doesn't accept optional, so url needs to be unwrapped
 
 3. Turn it into UIImage
 let image = UIImage(data:imgData!) //UIImage() doesn't accept optional, so imgData needs to be unwrapped.
 
 4. Display it
 photoView.image = image

 */

if let url = URL(string:wrongURL), //url.pathExtension == "png"
    let data = try? Data(contentsOf:url),
let image = UIImage(data:data) {
    print("all three condtion are true")
    let view = UIImageView(image:image)
    PlaygroundPage.current.liveView = view

} else { print("can't find the image on line")}

enum DisplayImgError : Error {
    case invalidURL
}

guard let url = URL(string: urlString),let data = try? Data(contentsOf:url),
    let image = UIImage(data:data) else {
        throw DisplayImgError.invalidURL
//        fatalError("Not all three condtions are met")
}


/*============   optional chaining.
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html
 Optional chaing is a process to call properties and methods on a optional that might be nil.
 Two ways to call a property or a method on a optional, use ! to force unwrap or use ? to form a Optional Chain.
 Optional chiaining is similar to force unwrapping.But optional chaining falis gracefully when the optional is nil.
 Nothing after the question mark is guaranteed to be called.
 flatting operation,all the resutl from the properties/methods/functions after ? will warrped as an optional.

 - Optional Chain won't get runtime error. it fail gracefully ( it propogate Nil to next and ot won't crash app ).
*/

let myName: String? = "Patrick"
print(myName?.uppercased().lowercased())
// ? means the methods after ? may not be called.the restun String from the .lowercased() will be wrapped as optional string


class Person {
    var residence: Residence? // optional set default as nil
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
let roomCount = john.residence?.numberOfRooms
//! will trigger a runtime error , using ? instead to form optional chain that will make roomCount as Optional and set a default nil. And this won't fail. It just propogate nil.
john.residence = Residence()
let roomCountStillOptional = john.residence?.numberOfRooms // this will still optional even though that optional has value 1

if let roomCountNonOptional = john.residence?.numberOfRooms {
   type(of: roomCountNonOptional) // use optional binding to unwarp optional Int to nonOptional Int
}




// ===============  nil coalescing operator,"default operator"
let twentyThree: Int? = nil, fourtyTwo: Int? = nil, thirty: Int? = nil
let myJerseyNumber = twentyThree ?? fourtyTwo ?? thirty ?? 4 //4 is the defaul value
print(myJerseyNumber)


// ================ compare two optionals  ?
let jerseyNumber: Int? = 23
if twentyThree == 23 { //no work for greater than and less than <= , Swift only auto match the Type only for ==
    print("There are equal")
}


/*======= bang(!) operator , force unwarp

 only use bang operator when you are so certain that a value won't be nil that you want your program to crash if it ever is.
 You are so certian that there is gonna be a value there if for some reason there is not a value like something is majorly wrong so you want to just crash and not proceed. only for before production for development/debugging.
 
use if let or guard statement to safely unwarp
 https://stackoverflow.com/questions/39455123/how-to-avoid-force-unwrapping-a-variable
 
func fullName() -> String {
    if let middleName = middleName {
        return "\(firstName) \(middleName) \(lastName)"
        
    } else {
        return "\(firstName) \(lastName)"
    }
}

func fullName() -> String {
    guard let middleName = middleName else {
        return "\(firstName) \(lastName)"
    }
    return "\(firstName) \(middleName) \(lastName)"
}

 */


class CPerson{
    var firstName: String
    var middleName: String?
    var lastName: String
    
    init(firstName: String, middleName: String? = nil, lastName: String) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
    
 //// another init with two parameters but this can be done by add default value for midname in the main init
//    convenience init(firstName: String, lastName: String) {
//        self.init(firstName: firstName, middleName: nil, lastName: lastName)
//    }
    
//// we don't need to force unwarp here.
//    func fullName() -> String {
//        if middleName == nil {
//            return "\(firstName) \(lastName)"
//        }else{
//            return "\(firstName) \(middleName!) \(lastName)"
//        }
//    }

    func fullName() -> String {
        guard let middleName = middleName else {
            return "\(firstName) \(lastName)"
        }
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let finni = CPerson(firstName: "finnigane", middleName: nil, lastName: "lee")
print(finni.fullName())


let rodi = CPerson(firstName: "jerrorld", lastName: "lee")
print(rodi.fullName())
