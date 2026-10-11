Function BuildPrefix(arr() As Long) As Long()
    Dim p() As Long, i As Long
    ReDim p(0 To UBound(arr) + 1)
    For i = 0 To UBound(arr)
        p(i + 1) = p(i) + arr(i)
    Next i
    BuildPrefix = p
End Function

Function RangeTotal(p() As Long, ByVal first As Long, ByVal last As Long) As Long
    RangeTotal = p(last + 1) - p(first)
End Function

Sub Main()
    Dim a(5) As Long, i As Long
    For i = 0 To 5: a(i) = (i + 1) * 3: Next i
    Dim p() As Long
    p = BuildPrefix(a)
    Debug.Print "Sum[0..5] = " & RangeTotal(p, 0, 5)
    Debug.Print "Sum[2..4] = " & RangeTotal(p, 2, 4)
End Sub
