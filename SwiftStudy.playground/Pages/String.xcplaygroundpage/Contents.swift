import Foundation

/* ======================= String interpolationFoundation
 https://stackoverflow.com/questions/38675957/difference-between-string-interpolation-and-string-initializer-in-swift
 
 String interpolation "\(item)" gives you the result of calling description on the item. String(item) calls a String initializer and returns a String value, which frequently is the same as the String you would get from string interpolation, but it is not guaranteed.
 

*/
var a: Int = 2

var c: Character = "e"

var d: String = "\(a)\(c)"

var e: String = String(a) + String(c)


class MyClass: CustomStringConvertible {
    var str: String
    
    var description: String { return "MyClass - \(str)" }
    
    init(str: String) {
        self.str = str
    }
}

extension String {
    init(_ myclass: MyClass) {
        self = myclass.str
    }
}

let mc = MyClass(str: "Hello")
String(mc)  // "Hello"
"\(mc)"     // "MyClass - Hello"

