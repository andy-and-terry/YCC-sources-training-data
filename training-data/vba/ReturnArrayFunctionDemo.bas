Function Squares(ByVal n As Long) As Long()
    Dim result() As Long
    Dim i As Long
    ReDim result(1 To n)
    For i = 1 To n
        result(i) = i * i
    Next i
    Squares = result
End Function

Function MinMax(arr() As Long) As Variant
    Dim lo As Long, hi As Long, i As Long
    lo = arr(LBound(arr)): hi = lo
    For i = LBound(arr) To UBound(arr)
        If arr(i) < lo Then lo = arr(i)
        If arr(i) > hi Then hi = arr(i)
    Next i
    MinMax = Array(lo, hi)
End Function

Sub Main()
    Dim sq() As Long
    Dim mm As Variant
    Dim i As Long
    sq = Squares(6)
    For i = LBound(sq) To UBound(sq)
        Debug.Print sq(i);
    Next i
    Debug.Print
    mm = MinMax(sq)
    Debug.Print "min=" & mm(0) & " max=" & mm(1)
End Sub
