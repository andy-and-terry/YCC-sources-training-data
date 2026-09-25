using System;
using System.Linq;
using System.Threading.Tasks;

public class InsufficientFundsException : Exception
{
    public InsufficientFundsException(decimal requested, decimal available)
        : base($"requested {requested}, available {available}") { }
}

public class BankAccountLock
{
    private readonly object _gate = new();
    private decimal _balance;

    public decimal Balance { get { lock (_gate) return _balance; } }

    public void Deposit(decimal amount)
    {
        if (amount <= 0) throw new ArgumentOutOfRangeException(nameof(amount));
        lock (_gate) _balance += amount;
    }

    public void Withdraw(decimal amount)
    {
        lock (_gate)
        {
            if (amount > _balance) throw new InsufficientFundsException(amount, _balance);
            _balance -= amount;
        }
    }

    public static async Task Main()
    {
        var acct = new BankAccountLock();
        await Task.WhenAll(Enumerable.Range(0, 8).Select(_ => Task.Run(() =>
        {
            for (var i = 0; i < 1000; i++) acct.Deposit(1m);
        })));
        Console.WriteLine(acct.Balance);
        try { acct.Withdraw(1_000_000m); }
        catch (InsufficientFundsException e) { Console.WriteLine(e.Message); }
    }
}
