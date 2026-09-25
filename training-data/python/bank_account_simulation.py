from dataclasses import dataclass, field
from datetime import datetime


class InsufficientFunds(Exception):
    pass


@dataclass
class Account:
    owner: str
    balance: int = 0  # cents
    history: list = field(default_factory=list)

    def _log(self, kind, amount):
        self.history.append((datetime.now().isoformat(timespec="seconds"), kind, amount, self.balance))

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("deposit must be positive")
        self.balance += amount
        self._log("deposit", amount)

    def withdraw(self, amount):
        if amount > self.balance:
            raise InsufficientFunds(f"{self.owner}: balance {self.balance}, requested {amount}")
        self.balance -= amount
        self._log("withdraw", amount)


class Bank:
    def __init__(self):
        self.accounts = {}

    def open(self, owner, initial=0):
        acct = Account(owner)
        if initial:
            acct.deposit(initial)
        self.accounts[owner] = acct
        return acct

    def transfer(self, src, dst, amount):
        a, b = self.accounts[src], self.accounts[dst]
        a.withdraw(amount)
        b.deposit(amount)


if __name__ == "__main__":
    bank = Bank()
    bank.open("alice", 10_000)
    bank.open("bob", 500)
    bank.transfer("alice", "bob", 2_500)
    try:
        bank.transfer("bob", "alice", 99_999)
    except InsufficientFunds as e:
        print("error:", e)
    for name, acct in bank.accounts.items():
        print(name, acct.balance / 100, len(acct.history), "transactions")
