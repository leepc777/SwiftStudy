//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


print("======= Use Date() as unique name ? You can also use Time Interval.======")
let currentDateTime = Date()
type(of:currentDateTime) // Foundation.Date.Type
print(currentDateTime)  // 2019-02-04 01:09:55 +0000

print("============== set formate to convert Date to String ==============")
let formatter = DateFormatter()
formatter.dateFormat = "ddMMyyyy HHmmss"
print(formatter.string(from: currentDateTime))

formatter.dateFormat = "yyyyMMdd - HHmmss"
print(formatter.string(from: currentDateTime))

formatter.dateFormat = "yyyyMMddHHmmss"
let dateString = formatter.string(from: currentDateTime)
let dateInt = Int(dateString)

print(formatter.string(from: currentDateTime))


let anotherName = formatter.string(from: currentDateTime)+".wav"
print("&&&&& another possbile name:\(anotherName) &&&&&&& ")

print("============ Time interval is Double Type =============  ")
//timeInterval is Double Type
let timeRF = Date.timeIntervalSinceReferenceDate
type(of: timeRF) // Double.Type
let backToDate1 = Date(timeIntervalSinceReferenceDate: timeRF)
type(of: backToDate1)


print("======= Time interval : Double -> String -> Double ======= ")
let timeRFString = String(timeRF)
let timeRFDouble = Double(timeRFString)


let backToDate = Date(timeIntervalSinceReferenceDate: timeRFDouble!)

print("$$$ Date.timeIntervalSinceReferenceDate:->\(timeRF)<- backToDate->\(backToDate)")

