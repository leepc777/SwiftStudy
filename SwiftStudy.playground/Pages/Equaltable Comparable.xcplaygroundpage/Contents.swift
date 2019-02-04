//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

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


print(" ========  in 4.22, Swift will auto sync custom equaltable struct")
/*
 
 You can rely on automatic synthesis of the Equatable protocol’s requirements for a custom type when you declare Equatable conformance in the type’s original declaration and your type meets these criteria:
 For a struct, all its stored properties must conform to Equatable.
 For an enum, all its associated values must conform to Equatable. (An enum without associated values has Equatable conformance even without the declaration.)
 
*/

struct Country2: Equatable {
    let name: String
    let capital: String
    var visited: Bool
}

let france2 = Country2(name: "France", capital: "Paris", visited: true)
let spain2 = Country2(name: "Spain", capital: "Madrid", visited: true)
if france2 != spain2 { print("these two countries are not equal")}


print("============  Comparable ========== ")
// only need to implement the < to meet Comparable protocol
/*
 To add Comparable conformance to your custom types, define the < and == operators as static methods of your types. The == operator is a requirement of the Equatable protocol, which Comparable extends—see that protocol’s documentation for more information about equality in Swift. Because default implementations of the remainder of the relational operators are provided by the standard library, you’ll be able to use !=, >, <=, and >= with instances of your type without any further code.
*/

struct Country3: Comparable {
    static func < (lhs: Country3, rhs: Country3) -> Bool {
        return lhs.visitedDate < rhs.visitedDate
    }
    
    let name: String
    let capital: String
    var visited: Bool
    var visitedDate: Int
}

extension Country3 : CustomStringConvertible {
    var description: String {
        return name+"("+capital+")"
    }
    
    
}

let france3 = Country3(name: "France", capital: "Paris", visited: true,visitedDate:20001101)
let spain3 = Country3(name: "Spain", capital: "Madrid", visited: true,visitedDate:20021101)
if france3 != spain3{ print("these two countries are not equal")}

if france3 < spain3 { print("I visit \(france3) before \(spain3)")}
