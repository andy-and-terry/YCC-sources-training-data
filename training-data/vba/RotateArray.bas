Sub ReverseRange(a() As Long, ByVal lo As Long, ByVal hi As Long)
    Dim tmp As Long
    Do While lo < hi
        tmp = a(lo): a(lo) = a(hi): a(hi) = tmp
        lo = lo + 1
        hi = hi - 1
    Loop
End Sub

Sub RotateRight(a() As Long, ByVal k As Long)
    Dim n As Long
    n = UBound(a) - LBound(a) + 1
    k = ((k Mod n) + n) Mod n
    If k = 0 Then Exit Sub
    ReverseRange a, LBound(a), UBound(a)
    ReverseRange a, LBound(a), LBound(a) + k - 1
    ReverseRange a, LBound(a) + k, UBound(a)
End Sub

Sub Main()
    Dim nums(0 To 6) As Long
    Dim i As Long, line As String
    For i = 0 To 6: nums(i) = i + 1: Next i
    RotateRight nums, 3
    For i = 0 To 6: line = line & nums(i) & " ": Next i
    Debug.Print Trim(line)
End Sub
