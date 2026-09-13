class Account {
    String owner
    double balance = 0.0

    void deposit(double amount) {
        balance += amount
    }

    void withdraw(double amount) {
        balance -= amount
    }
}

def account = new Account(owner: "Alice").with {
    deposit(100.0)
    deposit(50.0)
    withdraw(20.0)
    return it
}
println "${account.owner}: ${account.balance}"

def log = []
def result = account.tap {
    log << "balance checked: ${it.balance}"
}.balance

println log
println result
