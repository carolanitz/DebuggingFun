//: [Previous](@previous)

import Foundation

//puts you into "Swift mode" and removes the need to cast structs in a lot of places.
Symbol:
UIApplicationMain

Action:

Debugger Command: expr @import UIKit
Debugger Command: expr @import Foundation

Automatically continue ✅

//Breaks in places where KVO complains about observers still being in place. When you deallocate an object but the observer is still in place your app crashes when it still gets a message send. This lets you know before you experience the first crash that you missed removing an observer
Symbol:
NSKVODeallocateBreak

//Add to your exception breakpoint this and print the exception to Xcode’s console.
Debugger command: po $arg1

//Catch undesirable constraint configurations also available as constraint breakpoint
Symbol:
UIViewAlertForUnsatisfiableConstraints

//less frequent but also great for catching constraint problems
Symbol:
-[UIView(UIConstraintBasedLayout) _viewHierarchyUnpreparedForConstraint:]

//Catch layout errors in UICollectionView’s flow layout.
Symbol:
UICollectionViewFlowLayoutBreakForInvalidSizes

//Prints the class of a view controller during its initialization.
Symbol:
-[UIViewController initWithNibName:bundle:]
Debugger command: po $arg1

//Stops when an event is delivered, such as the touch of a button. Activate this breakpoint if you do not know what method a button calls on touch. p (SEL)$arg3 will print the selector that is invoked and po $arg4 the target it is invoked on.
Symbol:
-[UIApplication sendAction:toTarget:fromSender:forEvent:]

//Stops when CoreGraphics generates an error message, e.g. if you accidentally put a NaN in a drawing call somewhere.
Symbol:
CGPostError

//Stops when an already initialized NSData object gets initialized again.
Symbol:
_NSDataReinitializationBreak

//: [Next](@next)
