import XCTest
@testable import pb3
class pb3Tests: XCTestCase {
    func testExample() {
      do {
        let book = try BookInfo(jsonString: "{\"id\": 100, \"title\": \"Peppa Pig\", \"author\": \"BBC\"}")
        print(book)
        let bin = try book.serializedData()
        let buf = bin.map { $0 }
        print(buf)
        let str = String(cString: buf)
        print(str)
        let json = try book.jsonString()
        print(json)
        var lib = MyLibrary()
        lib.id = 200
        lib.name = "Angus Glen"
        lib.books.append(book)
        lib.books.append(try BookInfo(jsonString: "{\"id\": 200, \"title\": \"A Journey to the West\", \"author\": \"ChenEn Wu\"}"))
        let j2 = try lib.jsonString()
        print(j2)
        let dat = Data(bytes: buf)
        let b2 = try BookInfo(serializedData: dat)
        let j3 = try b2.jsonString()
        print(j3)
      }catch {
        XCTFail("\(error)")
      }

    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
