<?php

final class InsufficientFundsException extends RuntimeException
{
}

final class Account
{
    /** @var list<array{string,int,int}> */
    private array $history = [];

    public function __construct(public readonly string $owner, private int $balanceCents = 0)
    {
    }

    public function balance(): int
    {
        return $this->balanceCents;
    }

    public function deposit(int $cents): void
    {
        if ($cents <= 0) {
            throw new InvalidArgumentException('deposit must be positive');
        }
        $this->balanceCents += $cents;
        $this->history[] = ['deposit', $cents, $this->balanceCents];
    }

    public function withdraw(int $cents): void
    {
        if ($cents > $this->balanceCents) {
            throw new InsufficientFundsException("{$this->owner}: balance {$this->balanceCents}, requested $cents");
        }
        $this->balanceCents -= $cents;
        $this->history[] = ['withdraw', $cents, $this->balanceCents];
    }

    public function historyCount(): int
    {
        return count($this->history);
    }
}

final class Bank
{
    /** @var array<string, Account> */
    private array $accounts = [];

    public function open(string $owner, int $initial = 0): Account
    {
        $acct = new Account($owner);
        if ($initial > 0) {
            $acct->deposit($initial);
        }
        return $this->accounts[$owner] = $acct;
    }

    public function transfer(string $from, string $to, int $cents): void
    {
        $this->accounts[$from]->withdraw($cents);
        $this->accounts[$to]->deposit($cents);
    }

    /** @return array<string, Account> */
    public function accounts(): array
    {
        return $this->accounts;
    }
}

$bank = new Bank();
$bank->open('alice', 10_000);
$bank->open('bob', 500);
$bank->transfer('alice', 'bob', 2_500);
try {
    $bank->transfer('bob', 'alice', 99_999);
} catch (InsufficientFundsException $e) {
    echo 'error: ', $e->getMessage(), PHP_EOL;
}
foreach ($bank->accounts() as $name => $acct) {
    printf("%s %.2f (%d tx)\n", $name, $acct->balance() / 100, $acct->historyCount());
}
