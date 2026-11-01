Function SafeDivide(a As Double, b As Double) As Variant
    On Error GoTo Handler
    SafeDivide = a / b
    Exit Function
Handler:
    SafeDivide = CVErr(xlErrDiv0)
    Debug.Print "Error " & Err.Number & ": " & Err.Description
End Function
