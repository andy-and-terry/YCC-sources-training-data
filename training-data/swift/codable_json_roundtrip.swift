import Foundation

struct Item: Codable, Equatable {
    let id: Int
    let title: String
    let tags: [String]
    var due: Date? = nil
    enum CodingKeys: String, CodingKey { case id, title, tags, due = "due_date" }
}

let item = Item(id: 1, title: "write", tags: ["a", "b"])
let enc = JSONEncoder()
enc.outputFormatting = [.sortedKeys]
let data = try! enc.encode(item)
print(String(data: data, encoding: .utf8)!)
let back = try! JSONDecoder().decode(Item.self, from: data)
print(back == item)
let obj = try! JSONSerialization.jsonObject(with: Data("{\"a\":[1,2]}".utf8)) as! [String: Any]
print(obj["a"] as! [Int])
