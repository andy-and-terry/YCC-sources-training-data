class Account {
    [decimal]$Balance = 0
    [void] Deposit([decimal]$n) { $this.Balance += $n }
    [bool] Withdraw([decimal]$n) {
        if ($n -gt $this.Balance) { return $false }
        $this.Balance -= $n; return $true
    }
}
$a = [Account]::new()
$a.Deposit(100)
$a.Withdraw(30)
$a.Balance
