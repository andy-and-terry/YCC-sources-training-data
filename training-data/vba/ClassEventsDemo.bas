' Class module: Button
Public Event Click(ByVal label As String)

Public Sub Press(ByVal label As String)
    RaiseEvent Click(label)
End Sub
