sealed class Txn {
  const Txn(this.amount);
  final int amount;
}

final class Deposit extends Txn {
  const Deposit(super.amount);
}

final class Withdrawal extends Txn {
  const Withdrawal(super.amount);
}

class InsufficientFunds implements Exception {
  InsufficientFunds(this.requested, this.available);
  final int requested, available;
  @override
  String toString() => 'InsufficientFunds(requested: $requested, available: $available)';
}

class BankAccount {
  final _ledger = <Txn>[];

  int get balance => _ledger.fold(0, (sum, t) => switch (t) {
        Deposit(:final amount) => sum + amount,
        Withdrawal(:final amount) => sum - amount,
      });

  void deposit(int amount) {
    if (amount <= 0) throw ArgumentError.value(amount, 'amount', 'must be positive');
    _ledger.add(Deposit(amount));
  }

  void withdraw(int amount) {
    if (amount > balance) throw InsufficientFunds(amount, balance);
    _ledger.add(Withdrawal(amount));
  }
}

void main() {
  final acct = BankAccount()
    ..deposit(100)
    ..withdraw(30);
  try {
    acct.withdraw(1000);
  } on InsufficientFunds catch (e) {
    print(e);
  }
  print(acct.balance);
}
