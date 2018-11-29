import UIKit

/* Some snippets that you can use for debugging*/

//Getting all the notifications:
let center = NotificationCenter.default
center.addObserver(forName: nil, object: nil, queue: nil) {
    notification in
    print(notification.name)
}

// Getting all properties needs objc/runtime.h in objective-C, replace UICollectionView with the desired class

func getAllPropertis() {
        var count: CUnsignedInt = 0
        let ivarList = class_copyIvarList(UICollectionView.self, &count)
        for i in (0..<Int(count)) {
            if let unwrapped = ivarList?[i], let ivar = ivar_getName(unwrapped), let typeEncoding = ivar_getTypeEncoding(unwrapped) {
                let propertyName = String(cString: ivar)
                let typeEncoding = String(cString: typeEncoding)
                print("Property:\(propertyName), Type:\(typeEncoding)")
            } }
        free(ivarList)
}

/*
# Get all functions
 to decifer the typeencoding: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 */

 func getAllMethods() {
        var count: CUnsignedInt = 0
        let methodList = class_copyMethodList(UICollectionView.self, &count)
        for i in (0..<Int(count)) {
            if let unwrapped = methodList?[i], let typeEncoding = method_getTypeEncoding(unwrapped) {
                let methodSelector = method_getName(unwrapped)
                let returnTypeCString = method_copyReturnType(unwrapped)
                let methodName = NSStringFromSelector(methodSelector)
                let typeEncoding = String(cString: typeEncoding)
                let returnType = String(cString: returnTypeCString)
                free(returnTypeCString)
                print("Method:\(methodName), Type:\(typeEncoding), ReturnType:\(returnType)")
            } }
        free(methodList)
    }
