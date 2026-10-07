enum BankError: Error {
    case insufficientFunds(requested: Int, available: Int)
}

actor BankAccount {
    private(set) var balance = 0

    func deposit(_ amount: Int) {
        precondition(amount > 0, "amount must be positive")
        balance += amount
    }

    func withdraw(_ amount: Int) throws {
        guard amount <= balance else {
            throw BankError.insufficientFunds(requested: amount, available: balance)
        }
        balance -= amount
    }
}

let account = BankAccount()
await withTaskGroup(of: Void.self) { group in
    for _ in 0..<8 {
        group.addTask { for _ in 0..<1000 { await account.deposit(1) } }
    }
}
print(await account.balance)
do {
    try await account.withdraw(1_000_000)
} catch {
    print(error)
}
