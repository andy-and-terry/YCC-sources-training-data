import Foundation

struct User: Codable {
    let name: String
    let age: Int
    let tags: [String]
}

let json = """
{"name": "Ada", "age": 30, "tags": ["math", "engineering"]}
"""

let data = json.data(using: .utf8)!
let user = try! JSONDecoder().decode(User.self, from: data)
print(user.name, user.age, user.tags)
