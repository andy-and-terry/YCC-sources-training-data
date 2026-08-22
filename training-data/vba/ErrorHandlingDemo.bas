Function SafeDivide(ByVal a As Double, ByVal b As Double) As Variant
    On Error GoTo ErrorHandler
    SafeDivide = a / b
    Exit Function
ErrorHandler:
    Debug.Print "error: " & Err.Description
    SafeDivide = Null
End Function

Sub Main()
    Debug.Print SafeDivide(10, 2)
    Debug.Print SafeDivide(5, 0)
End Sub
