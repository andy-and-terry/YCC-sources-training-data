import threading


class InsufficientFunds(Exception):
    pass


class BankAccount:
    def __init__(self, balance=0):
        self._balance = balance
        self._lock = threading.Lock()

    @property
    def balance(self):
        with self._lock:
            return self._balance

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("amount must be positive")
        with self._lock:
            self._balance += amount

    def withdraw(self, amount):
        with self._lock:
            if amount > self._balance:
                raise InsufficientFunds(amount)
            self._balance -= amount


if __name__ == "__main__":
    acct = BankAccount()
    threads = [threading.Thread(target=lambda: [acct.deposit(1) for _ in range(1000)]) for _ in range(8)]
    for t in threads: t.start()
    for t in threads: t.join()
    print(acct.balance)
