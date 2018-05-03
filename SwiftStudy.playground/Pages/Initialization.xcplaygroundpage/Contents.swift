import Foundation

/* ==================== initialization ==================

 "Initialization"
 Initialization is the "process" of preparing an instance of a class, structure, or enumeration for use. This process involves setting an initial value for each "stored property" on that instance and performing any other setup or initialization that is required before the new instance is ready for use.

 "Setting Initial Values for Stored Properties"
 Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties cannot be left in an indeterminate state.
 You can set an initial value for a stored property within an initializer, or by assigning a default property value as part of the property’s definition. These actions are described in the following sections.

 
*/


/* =================  custom init()
  - Class and Struct can have mutliple custom init()
  - Struct has built-in memerwise init(). so you don't need to set initial value when definting struct. The memberwise init() will give the value when instantiating the struct. Class must have a custom init() to do the same
*/




/* =================    Initializer Delegation  ============================
 
 Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.
 
 - Value Type struct and enumeration do not support inheritance. Can only delegate to initializers they provide themself.
 
*/

// Value Type //////
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {}  // default init
    
    init(origin: Point, size: Size) { //custom init(origin:size:)
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) { //custom init(center:size:) call the defaul init()
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
}

let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


/// Class
