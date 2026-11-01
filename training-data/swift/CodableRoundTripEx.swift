import Foundation

struct User: Codable { let id: Int; let name: String }

let data = try JSONEncoder().encode(User(id: 1, name: "ann"))
print(String(data: data, encoding: .utf8)!)
let back = try JSONDecoder().decode(User.self, from: data)
print(back.name)
