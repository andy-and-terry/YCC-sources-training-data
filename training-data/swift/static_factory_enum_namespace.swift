enum MathUtil {
    static let tau = 2 * Double.pi

    static func degrees(fromRadians r: Double) -> Double { r * 180 / .pi }
    static func lerp(_ a: Double, _ b: Double, t: Double) -> Double { a + (b - a) * t }
    static func isPowerOfTwo(_ n: Int) -> Bool { n > 0 && n & (n - 1) == 0 }
}

print(MathUtil.degrees(fromRadians: .pi / 2))
print(MathUtil.lerp(10, 20, t: 0.25))
print([1, 6, 8, 64].map(MathUtil.isPowerOfTwo))
print(MathUtil.tau)
