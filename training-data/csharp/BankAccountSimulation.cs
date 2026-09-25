using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

sealed class InsufficientFundsException : Exception
{
    public InsufficientFundsException(int id, long have, long need) : base($"account {id}: have {have}, need {need}") { }
}

sealed class Account
{
    public int Id { get; }
    public long Balance { get; private set; }
    public object Gate { get; } = new();

    public Account(int id, long balance) => (Id, Balance) = (id, balance);

    // Always lock the lower id first so opposite transfers cannot deadlock.
    public static void Transfer(Account from, Account to, long amount)
    {
        if (ReferenceEquals(from, to)) return;
        var (first, second) = from.Id < to.Id ? (from, to) : (to, from);
        lock (first.Gate)
        lock (second.Gate)
        {
            if (from.Balance < amount) throw new InsufficientFundsException(from.Id, from.Balance, amount);
            from.Balance -= amount;
            to.Balance += amount;
        }
    }
}

class BankAccountSimulation
{
    static void Main()
    {
        var accounts = Enumerable.Range(0, 5).Select(i => new Account(i, 1000)).ToArray();
        int rejected = 0;
        Parallel.For(0, 8, t =>
        {
            var rng = new Random(t);
            for (int i = 0; i < 20000; i++)
            {
                try
                {
                    Account.Transfer(accounts[rng.Next(5)], accounts[rng.Next(5)], rng.Next(100));
                }
                catch (InsufficientFundsException)
                {
                    Interlocked.Increment(ref rejected);
                }
            }
        });
        Console.WriteLine($"total {accounts.Sum(a => a.Balance)} (expected 5000), rejected {rejected}");
    }
}
