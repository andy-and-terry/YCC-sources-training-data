' Class module: BankAccount
Private m_Balance As Double

Public Property Get Balance() As Double
    Balance = m_Balance
End Property

Public Property Let Balance(ByVal newValue As Double)
    If newValue < 0 Then
        Err.Raise vbObjectError + 1, "BankAccount", "Balance cannot be negative"
    End If
    m_Balance = newValue
End Property

Public Sub Deposit(ByVal amount As Double)
    Balance = Balance + amount
End Sub

Public Sub Withdraw(ByVal amount As Double)
    If amount > m_Balance Then
        Err.Raise vbObjectError + 2, "BankAccount", "Insufficient funds"
    End If
    Balance = Balance - amount
End Sub

' The following would live in a standard module
Sub Main()
    Dim acct As New BankAccount
    acct.Deposit 100
    acct.Deposit 50
    Debug.Print acct.Balance

    On Error GoTo ErrorHandler
    acct.Withdraw 1000
    Exit Sub

ErrorHandler:
    Debug.Print "error: " & Err.Description
End Sub
