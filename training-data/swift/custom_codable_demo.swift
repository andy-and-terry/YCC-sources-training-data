import Foundation

struct Address: Codable {
    let city: String
    let zipCode: String

    enum CodingKeys: String, CodingKey {
        case city
        case zipCode = "zip_code"
    }
}

struct Profile: Codable {
    let fullName: String
    let age: Int
    let address: Address

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case age
        case address
    }

    init(fullName: String, age: Int, address: Address) {
        self.fullName = fullName
        self.age = age
        self.address = address
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fullName = try container.decode(String.self, forKey: .fullName)
        age = try container.decodeIfPresent(Int.self, forKey: .age) ?? 0
        address = try container.decode(Address.self, forKey: .address)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(age, forKey: .age)
        try container.encode(address, forKey: .address)
    }
}

let json = """
{"full_name": "Grace Hopper", "age": 85, "address": {"city": "Arlington", "zip_code": "22201"}}
"""

let data = json.data(using: .utf8)!
let profile = try! JSONDecoder().decode(Profile.self, from: data)
print(profile.fullName, profile.age, profile.address.city)

let encoded = try! JSONEncoder().encode(profile)
print(String(data: encoded, encoding: .utf8)!)
