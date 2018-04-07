import Foundation

/*
 what is set
 
 1. a collection without order
 2. No duplicate elements
 3. insert/remove : .insert() .remove()
 
 
*/


var ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt" , "sugar", "sugar"] // will only contains one sugar !
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

print(ingredients)
ingredients.remove("sugar")
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

// what is equatable ? to make type can be compared for value equalty

struct Country {
    let name: String
    let capital: String
    var visited: Bool
}

extension Country: Equatable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name &&
            lhs.capital == rhs.capital &&
            lhs.visited == rhs.visited
    }
}

let france = Country(name: "France", capital: "Paris", visited: true)
let spain = Country(name: "Spain", capital: "Madrid", visited: true)
if france != spain { print("these two countries are not equal")}
