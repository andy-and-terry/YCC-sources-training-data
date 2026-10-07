' Class module: BankAccount
Private mBalance As Double

Public Property Get Balance() As Double
    Balance = mBalance
End Property

Public Property Let Balance(ByVal newBalance As Double)
    If newBalance < 0 Then
        Err.Raise vbObjectError + 1, "BankAccount", "Balance cannot be negative"
    End If
    mBalance = newBalance
End Property

Public Sub Deposit(ByVal amount As Double)
    Balance = Balance + amount
End Sub

Public Sub Withdraw(ByVal amount As Double)
    If amount > mBalance Then
        Err.Raise vbObjectError + 2, "BankAccount", "Insufficient funds"
    End If
    Balance = Balance - amount
End Sub
