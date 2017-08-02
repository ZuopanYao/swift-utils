import Cocoa
/**
 * Convenince extensions for often used string methods
 */
extension String {
    //init(_ value:Any) doesnt work as String("hello".reversed()) must go through 
    init(_ value:CGFloat){self.init(describing:value)}/*Brings back simple String casting which was removed in swift 3*/
    init(_ value:Int){self.init(describing:value)}/*Brings back simple String casting which was removed in swift 3*/
    init(_ value:Bool){self.init(describing:value)}/*Brings back simple String casting which was removed in swift 3*/
    /**
     * EXAMPLE: "this is cool".split(" ")//output: ["this","is","cool"]
     */
    func split(_ delimiter:String)->[String]{/*Convenince*/
        return StringParser.split(self, delimiter)
    }
    func match(_ pattern: String!, _ options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> [String]{//Convenince
        return RegExp.match(self, pattern, options)
    }
    func matches(_ pattern: String!, _ options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> [NSTextCheckingResult] {//Convenince
        return RegExp.matches(self,pattern,options)
    }
    func test(_ pattern:String)->Bool{/*Convenince*/
        return RegExp.test(self, pattern)
    }
    func replace(_ pattern:String,_ replacement:String)->String{/*Convenince*/
        return RegExp.replace(self,pattern, replacement)
    }
    func search(_ pattern:String)->Int?{/*Convenince*/
        return RegExp.search(self,pattern)
    }
    func encode()->String?{/*Convenince*/
        return StringParser.encode(self)
    }
    func decode()->String?{/*Convenince*/
        return StringParser.decode(self)
    }
    func subStr(_ i:Int,_ len:Int)->String{/*Convenince*/
        return StringParser.subStr(self, i, len)
    }
    func subString(_ beginning:Int,_ end:Int)->String{/*Convenince*/
        return StringParser.subString(self,beginning,end)
    }
    func indexOf(_ b:String)->Int{/*Convenince*/
        return StringParser.indexOf(self, b)
    }
    func trim(_ leftAndRight:Character)->String{/*Convenince*/
        return StringParser.trim(self, leftAndRight)
    }
    func trimRight(_ right:Character)->String{/*Convenince*/
        return StringParser.trimRight(self, right)
    }
    func trimLeft(_ left:Character)->String{/*Convenince*/
        return StringParser.trimLeft(self, left)
    }
    func insertCharsAt(_ charsAndIndicies:[(char:Character,index:Int)])->String{
        return StringModifier.insertCharsAt(self, charsAndIndicies)
    }
    func idx(_ index:Int) -> String.Index{
        return StringParser.idx(self, index)
    }
    func stringRange(_ str:String,_ beginning:Int, end:Int) -> Range<String.Index>{
        let startIndex = str.idx(beginning)
        let endIndex = str.idx(end/*-beginning*/)//<--this was a bug
        return startIndex..<endIndex
    }
    func array<T>(_ cast:(_ char:Character)->T)->[T]{
        return StringParser.array(self, cast)
    }
    /**
     * CAUTION: if you do "0xFF0000FF".uint it will give the wrong value, use UInt(Double("")!) instead for cases like that
     */
    var uint:UInt{return UInt(Float(self)!)}
    
    /**
     * EXAMPLE: "<p>text</p>".xml//Output: xml
     */
    var xml:XML {return XML(self)}/*Convenince*/
    var url:URL {return FilePathParser.path(self)}/*Convenince*/
    var lineCount:Int{return StringParser.lineCount(self)}
    var content:String? {return FileParser.content(self.tildePath)}
    var bool:Bool {return StringParser.boolean(self)}
    var nsColor:NSColor{return StringParser.nsColor(self)}
    var int:Int{return Int(self)!}
    /*from relative to absolute URL*/
    var tildePath:String {return NSString(string: self).expandingTildeInPath}/*Convenince*/
    /*from absolute to relative URL*/
    var tildify:String {return NSString(string:self).abbreviatingWithTildeInPath}/*Convenince*/
    
    var count:Int{return self.characters.count}/*Convenince*/
    var cgFloat:CGFloat{return CGFloat(Double(self)!)}//TODO:you should also do the same for the Any type
    var double:Double{return Double(self)!}
    var json:Any? {return JSONParser.json(self)}
    func removeLastChar() -> String {return StringModifier.removeLastChar(self)}
}
extension NSString{
    var string:String {return String(self)}/*Convenience*/
}
extension Bool{
    var str:String {return self.description}
}
/**
 * Multiplies a string
 * EXAMPLE: "hello" * 3 //hellohellohello
 */
public func * (left: String, right: Int) -> String {
    return (0..<right).indices.reduce("") { interim,_ in
        return interim + left
    }
}
