enum Payment {
    case cash(Double)
    case card(number: String, limit: Double)
    case voucher
}

func describe(_ p: Payment) -> String {
    switch p {
    case .cash(let amount) where amount > 100: return "large cash \(amount)"
    case .cash(let amount): return "cash \(amount)"
    case .card(let number, _): return "card ending \(number.suffix(4))"
    case .voucher: return "voucher"
    }
}

print(describe(.cash(250)))
print(describe(.cash(20)))
print(describe(.card(number: "1234567812345678", limit: 500)))
print(describe(.voucher))
