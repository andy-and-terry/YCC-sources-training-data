Sub ErrorHandlingGoto()
    On Error GoTo Handler
    Dim x As Long
    x = 1 / 0
    Exit Sub
Handler:
    Debug.Print "Error " & Err.Number & ": " & Err.Description
End Sub
