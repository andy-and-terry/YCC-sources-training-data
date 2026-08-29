Function SafeDivide(a As Long, b As Long) As Variant
    On Error GoTo ErrorHandler
    SafeDivide = a / b
    Exit Function
ErrorHandler:
    Debug.Print "Error: " & Err.Description
    SafeDivide = Null
End Function

Sub Main()
    Debug.Print SafeDivide(10, 2)
    Debug.Print SafeDivide(10, 0)
End Sub
