Function SafeDiv(a As Double, b As Double) As Variant
    On Error GoTo Handler
    SafeDiv = a / b
    Exit Function
Handler:
    SafeDiv = CVErr(xlErrDiv0)
End Function
