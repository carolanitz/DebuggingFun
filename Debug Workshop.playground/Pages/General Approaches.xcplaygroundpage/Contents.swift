//: [Previous](@previous)
import UIKit

//#Eliminate Variables

//simplify to find out what the underlying problem is

func randomInt(number:CGFloat) -> Int {
    return Int(arc4rand_uniform(UInt32(number)))
}
//this
func randomPointInRectangle(rectangle: CGRect) {
    return CGPoint(x: randomInt(rectangle.size.width), y:randomInt(rectangle.size.height)) // used to complain that it can't invoke CGPoint with argument list of $T4 $T5
}
//vs:
func randomPointInRectangle(rectangle: CGRect) {
    return CGPoint(x: 23, y:23) // here it finally gave a better error message : // used to complain that it can't invoke CGPoint with arggument list of IntegerLiteral
}

//#Split up complicated code into it's subparts

func randomPointInRectangle(rectangle: CGRect) {
    return CGPoint(x: 23, y:23)
}

//vs.

func randomPointInRectangle(rectangle: CGRect) {
    let point = CGPoint(x: 23, y:23) // creating
    return point // returning
}
//here it finally gave a the error message we were looking for CGPoint is not convertible to () we're missing the return type

//: [Next](@next)
