' Class module: Button
Public Event Click(ByVal label As String)

Public Sub Press(ByVal label As String)
    RaiseEvent Click(label)
End Sub

' Class module: ButtonHandler
Private WithEvents mButton As Button

Public Sub Attach(ByVal btn As Button)
    Set mButton = btn
End Sub

Private Sub mButton_Click(ByVal label As String)
    Debug.Print "Handled click: " & label
End Sub

' --- Standard module (references Button/ButtonHandler above) ---
Sub Main()
    Dim btn As New Button
    Dim handler As New ButtonHandler
    handler.Attach btn

    btn.Press "Submit"
    btn.Press "Cancel"
End Sub
