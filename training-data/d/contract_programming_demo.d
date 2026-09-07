import std.stdio;

class BankAccount {
    private double balance;

    this(double initial)
    in (initial >= 0, "initial balance must be non-negative")
    {
        balance = initial;
    }

    void withdraw(double amount)
    in (amount > 0, "amount must be positive")
    in (amount <= balance, "insufficient funds")
    out
    {
        assert(balance >= 0, "balance must never go negative");
    }
    do
    {
        balance -= amount;
    }

    double getBalance() { return balance; }

    invariant {
        assert(balance >= 0);
    }
}

int squareRoot(int n)
in (n >= 0, "n must be non-negative")
out (result; result * result <= n, "result must not overshoot")
do
{
    int r = 0;
    while ((r + 1) * (r + 1) <= n) r++;
    return r;
}

void main() {
    auto account = new BankAccount(100.0);
    account.withdraw(40.0);
    writeln(account.getBalance());

    writeln(squareRoot(50));

    try {
        account.withdraw(1000.0);
    } catch (Throwable e) {
        writeln("caught: ", e.msg);
    }
}
