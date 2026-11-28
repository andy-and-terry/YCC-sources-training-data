Function SafeDiv(a As Double, b As Double) As Variant
    On Error GoTo Fail
    SafeDiv = a / b
    Exit Function
Fail:
    SafeDiv = CVErr(xlErrDiv0)
End Function
