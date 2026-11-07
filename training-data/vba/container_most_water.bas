Public Function MaxArea(h As Variant) As Long
    Dim lo As Long, hi As Long, best As Long, m As Long
    lo = LBound(h): hi = UBound(h)
    Do While lo < hi
        If h(lo) < h(hi) Then m = h(lo) Else m = h(hi)
        If m * (hi - lo) > best Then best = m * (hi - lo)
        If h(lo) < h(hi) Then lo = lo + 1 Else hi = hi - 1
    Loop
    MaxArea = best
End Function

Public Sub DemoMaxArea()
    Debug.Print MaxArea(Array(1, 8, 6, 2, 5, 4, 8, 3, 7)) ' 49
End Sub
