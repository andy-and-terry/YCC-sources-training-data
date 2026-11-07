Public Function PlusOne(digits As Variant) As Variant
    Dim n As Long, i As Long, d() As Long, out() As Long
    n = UBound(digits) - LBound(digits) + 1
    ReDim d(0 To n - 1)
    For i = 0 To n - 1: d(i) = digits(LBound(digits) + i): Next i
    For i = n - 1 To 0 Step -1
        If d(i) < 9 Then
            d(i) = d(i) + 1
            PlusOne = d
            Exit Function
        End If
        d(i) = 0
    Next i
    ReDim out(0 To n)
    out(0) = 1
    PlusOne = out
End Function

Public Sub DemoPlusOne()
    Debug.Print Join(PlusOne(Array(1, 2, 9)), ",") ' 1,3,0
    Debug.Print Join(PlusOne(Array(9, 9)), ",")    ' 1,0,0
End Sub
