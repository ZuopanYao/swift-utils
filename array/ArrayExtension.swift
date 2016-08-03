import Foundation
extension Array {
    /**
     * Removes the first item in an array
     * Shift
     * var a = ["a","b","c"]
     * Swift.print("a.shift(): " + "\(a.shift())")//a
     * Swift.print("a: " + "\(a)")//b,c
     */
    mutating func shift(/*x:[Element]*/) ->Element{
        return ArrayModifier.shift(&self)
    }
    mutating func pop() -> Element?{
        return ArrayModifier.pop(&self)
    }
    mutating func pushPop(item:Element) -> Array<Element>{
        return ArrayModifier.pushPop(&self, item)
    }
    /**
     * NOTE: the concat method is not like append. Append adds an item to the original array, concat creates a new array all together. 
     * IMPORTANT: this method was mutating before
     */
    func concat(array:Array<Element>) -> Array<Element>{
        return self + array
    }
    /**
     * IMPORTANT: this method was mutating before
     */
    func concat(item:Element) -> Array<Element>{//Convenince
        return concat([item])
    }
    /**
     * Example: [1,2,3,4].splice(0, 1).count//3
     */
    mutating func splice(startIndex:Int,_ deleteCount:Int,_ values:Array<Element> = [])->Array<Element>{
        return ArrayModifier.splice(&self, startIndex, deleteCount, values)
    }
    mutating func unshift(item:Element)->Int{
        return ArrayModifier.unshift(&self, item)
    }
    func DEPRECATEDslice(startIndex:Int, _ endIndex:Int) ->Array<Element>{
        return ArrayModifier.DEPRECATEDslice(self,startIndex,endIndex)
    }
    func slice2(startIndex:Int, _ endIndex:Int) ->Array<Element>{
        return ArrayModifier.slice2(self,startIndex,endIndex)
    }
    func index<T : Equatable>(arr : [T], _ value:T)->Int{
        return ArrayParser.index(arr, value)
    }
    /**
     * -1 equals, does not exist
     * NOTE: there is also native: removeAtIndex(index: Int) -> Element
     */
    mutating func removeAt(i:Int){
        if(i != -1){self.splice(i, 1)}
    }
    /**
     * A neat way to cast Array's
     * NOTE: figure out a way to make it work with inout methods aswell
     */
    func cast<T>(type:T.Type) -> [T]{
        return self.map { $0 as! T }
    }
    
}
/**
 * NOTE: only applicable to Array<AnyObject>
 */
extension Array where Element:AnyObject{
    func indexOf(item:AnyObject)-> Int{
        return ArrayParser.indexOf(self,item)
    }
}

//TODO: Needs more research see similar case with AnyObject
/*
extension Array where Element:String{
    /**
     *
     */
    func join(seperator:String)->String{
        return StringModifier.combine(self as! Array<String>,seperator)
    }
    /**
     *
     */
    func indexOfStr(str:String)->Int{
        return ArrayParser.indexOfStr(self,str)
    }
}
*/