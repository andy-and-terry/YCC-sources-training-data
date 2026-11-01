enum Barcode {
    case upc(Int, Int, Int, Int)
    case qr(String)
}

for code in [Barcode.upc(8, 85909, 51226, 3), .qr("hello")] {
    switch code {
    case let .upc(a, b, c, d): print("UPC \(a)-\(b)-\(c)-\(d)")
    case .qr(let s): print("QR \(s)")
    }
}
