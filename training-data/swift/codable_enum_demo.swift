import Foundation

enum Shape: Codable {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case triangle(base: Double, height: Double)

    private enum CodingKeys: String, CodingKey {
        case type, radius, width, height, base
    }

    private enum ShapeType: String, Codable {
        case circle, rectangle, triangle
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(ShapeType.self, forKey: .type)
        switch type {
        case .circle:
            let radius = try container.decode(Double.self, forKey: .radius)
            self = .circle(radius: radius)
        case .rectangle:
            let width = try container.decode(Double.self, forKey: .width)
            let height = try container.decode(Double.self, forKey: .height)
            self = .rectangle(width: width, height: height)
        case .triangle:
            let base = try container.decode(Double.self, forKey: .base)
            let height = try container.decode(Double.self, forKey: .height)
            self = .triangle(base: base, height: height)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .circle(let radius):
            try container.encode(ShapeType.circle, forKey: .type)
            try container.encode(radius, forKey: .radius)
        case .rectangle(let width, let height):
            try container.encode(ShapeType.rectangle, forKey: .type)
            try container.encode(width, forKey: .width)
            try container.encode(height, forKey: .height)
        case .triangle(let base, let height):
            try container.encode(ShapeType.triangle, forKey: .type)
            try container.encode(base, forKey: .base)
            try container.encode(height, forKey: .height)
        }
    }

    var area: Double {
        switch self {
        case .circle(let radius): return .pi * radius * radius
        case .rectangle(let width, let height): return width * height
        case .triangle(let base, let height): return 0.5 * base * height
        }
    }
}

let shapes: [Shape] = [.circle(radius: 2), .rectangle(width: 3, height: 4), .triangle(base: 5, height: 6)]

let data = try! JSONEncoder().encode(shapes)
print(String(data: data, encoding: .utf8)!)

let decoded = try! JSONDecoder().decode([Shape].self, from: data)
for shape in decoded {
    print(shape.area)
}
