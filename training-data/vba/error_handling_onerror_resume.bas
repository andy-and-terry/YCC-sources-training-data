Sub Demo()
    On Error GoTo Handler
    Dim x As Integer
    x = 1 / 0
    Exit Sub
Handler:
    Debug.Print "Err " & Err.Number & ": " & Err.Description
End Sub
