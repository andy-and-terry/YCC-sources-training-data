Attribute VB_Name = "PatienceLis"
Sub Main()
    Dim a As Variant, tails(1 To 8) As Long
    Dim n As Long, i As Long, lo As Long, hi As Long, mid As Long
    a = Array(10, 9, 2, 5, 3, 7, 101, 18)
    For i = 0 To UBound(a)
        lo = 1: hi = n + 1
        Do While lo < hi
            mid = (lo + hi) \ 2
            If tails(mid) < a(i) Then lo = mid + 1 Else hi = mid
        Loop
        tails(lo) = a(i)
        If lo > n Then n = lo
    Next i
    Debug.Print n
End Sub
