<?php
declare(strict_types=1);

final class InsufficientFunds extends RuntimeException {}

final class BankAccount
{
    private int $cents = 0;
    /** @var list<array{string,int}> */
    private array $ledger = [];

    public function deposit(int $cents): void
    {
        if ($cents <= 0) throw new InvalidArgumentException('amount must be positive');
        $this->cents += $cents;
        $this->ledger[] = ['deposit', $cents];
    }

    public function withdraw(int $cents): void
    {
        if ($cents > $this->cents) throw new InsufficientFunds("requested $cents, have {$this->cents}");
        $this->cents -= $cents;
        $this->ledger[] = ['withdraw', $cents];
    }

    public function balance(): string
    {
        return number_format($this->cents / 100, 2);
    }

    public function ledger(): array { return $this->ledger; }
}

$a = new BankAccount();
$a->deposit(1050);
$a->withdraw(300);
try { $a->withdraw(99999); } catch (InsufficientFunds $e) { echo $e->getMessage(), PHP_EOL; }
echo $a->balance(), ' ', count($a->ledger()), PHP_EOL;
