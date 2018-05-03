import Foundation


/* ==========  Struct has built-in memerwise init() while Class doesn't  ==========
 
 1. so Struct can be defined without value because the constant/variable will get value when instantiating Struct
 2. Class must have intial value for constant/variable when defining the class. either set the default value or custom init() to assign the value
 
*/

struct SizeAsStruct {
    var width,height:Double
}

class SizeAsClass {
    var width = 0.0,height:Double = 0.0
}



/* ================== custom init() ========
 - struct/class can have multiple custom init()

*/
class SizeAsClassInit {
    var width,height:Double
    init(w:Double,h:Double) {
        width = w
        height = h
    }
    init(a:Double,b:Double) {
        width = a
        height = b
    }
    convenience init(aa:Double,bb:Double) {
        self.init(a: aa, b: bb)
    }
}

let klsdajfl=SizeAsClassInit(aa: 88, bb: 88)

let xyzz = SizeAsClass()
let twoByTwo = SizeAsStruct(width: 2.0, height: 2)


//============   Multiple custom init()  ===================================
struct Size2a { // custom init() will overwrite the default init(),
    var width : Double, height : Double
    init(a:Double,b:Double) {
        self.width = a
        self.height = b
    }
    init(aa:Double,bb:Double) {
        self.width = aa
        self.height = bb
    }
}



/*/======================  Value Type vs Reference Type  ================
 - A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.

 -  reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.
*/
struct colorStruct {
    var favorColor = "Gold"
}

class colorClass {
    var favorColor = "Blue"
}

var patrickColor = colorStruct(favorColor: "red")
patrickColor.favorColor

var finColor = colorStruct()
finColor.favorColor

let johnColor = finColor
finColor.favorColor = "black"
johnColor.favorColor

let samColor = colorClass()
let mikeColor = samColor // two instantces are pointing to the same reference. Both see the same update
samColor.favorColor = "black"
mikeColor.favorColor




