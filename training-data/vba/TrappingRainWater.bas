Function Trap(h() As Long) As Long
    Dim lo As Long, hi As Long, leftMax As Long, rightMax As Long, water As Long
    lo = LBound(h): hi = UBound(h)
    Do While lo < hi
        If h(lo) < h(hi) Then
            If h(lo) >= leftMax Then leftMax = h(lo) Else water = water + leftMax - h(lo)
            lo = lo + 1
        Else
            If h(hi) >= rightMax Then rightMax = h(hi) Else water = water + rightMax - h(hi)
            hi = hi - 1
        End If
    Loop
    Trap = water
End Function

Sub Main()
    Dim a As Variant, h() As Long, i As Long
    a = Array(0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1)
    ReDim h(0 To UBound(a))
    For i = 0 To UBound(a): h(i) = a(i): Next i
    Debug.Print "Water trapped: " & Trap(h)
End Sub
