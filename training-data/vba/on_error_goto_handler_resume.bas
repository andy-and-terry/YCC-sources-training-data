Sub SafeDivide()
    Dim a As Double, b As Double
    a = 10: b = 0
    On Error GoTo Handler
    Debug.Print a / b
    Exit Sub
Handler:
    Debug.Print "Error " & Err.Number & ": " & Err.Description
    Resume Next
End Sub
