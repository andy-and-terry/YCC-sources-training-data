actor BankAccount {
    private var balance: Int = 0

    func deposit(_ amount: Int) {
        balance += amount
    }

    func withdraw(_ amount: Int) -> Bool {
        guard balance >= amount else { return false }
        balance -= amount
        return true
    }

    func currentBalance() -> Int {
        balance
    }
}

func run() async {
    let account = BankAccount()
    await withTaskGroup(of: Void.self) { group in
        for _ in 0..<5 {
            group.addTask { await account.deposit(10) }
        }
    }
    let ok = await account.withdraw(30)
    print(ok)
    let balance = await account.currentBalance()
    print(balance)
}

Task {
    await run()
}
