import Foundation

/*
 what is set
 
 1. a collection without order
 2. No duplicate elements
 3. insert/remove : .insert() .remove()
 
 
*/

var anEmptySet : Set<String> = []
var aEmptySet = Set<String>()
aEmptySet.insert("a")
aEmptySet.contains("a")
aEmptySet.remove("a")
aEmptySet.isEmpty



var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2 = Set(arrayLiteral: "Rock", "Classical", "Hip hop")


var ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt" , "sugar", "sugar"] // will only contains one sugar !
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

print(ingredients)
ingredients.remove("sugar")
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

