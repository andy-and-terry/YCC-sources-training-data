' Class module: Account
Private mBalance As Double

Public Property Get Balance() As Double
    Balance = mBalance
End Property

Public Property Let Balance(v As Double)
    If v < 0 Then Err.Raise 5, , "negative balance"
    mBalance = v
End Property

Public Sub Deposit(amt As Double)
    mBalance = mBalance + amt
End Sub
