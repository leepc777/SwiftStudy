/*
 
 Optional represent a value may or may not contains any data.
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

if let url = URL(string:urlString), //url.pathExtension == "png"
    let data = try? Data(contentsOf:url),
let image = UIImage(data:data) {
    print("all three condtion are true")
    let view = UIImageView(image:image)
    PlaygroundPage.current.liveView = view

}
