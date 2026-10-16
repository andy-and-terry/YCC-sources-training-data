enum BankError: Error, CustomStringConvertible {
    case insufficientFunds(needed: Int, available: Int)
    case accountClosed

    var description: String {
        switch self {
        case let .insufficientFunds(needed, available):
            return "need \(needed) but only \(available) available"
        case .accountClosed:
            return "account is closed"
        }
    }
}

func withdraw(_ amount: Int, from balance: Int, open: Bool) throws -> Int {
    guard open else { throw BankError.accountClosed }
    guard balance >= amount else {
        throw BankError.insufficientFunds(needed: amount, available: balance)
    }
    return balance - amount
}

for (amt, open) in [(50, true), (500, true), (10, false)] {
    do {
        print("new balance:", try withdraw(amt, from: 100, open: open))
    } catch let e as BankError {
        print("error:", e)
    } catch {
        print("unexpected:", error)
    }
}
