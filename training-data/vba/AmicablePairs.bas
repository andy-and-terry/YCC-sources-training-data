' Amicable pairs: d(a) = b and d(b) = a with a <> b.
Private Function D(ByVal n As Long) As Long
    Dim i As Long, s As Long
    For i = 1 To n - 1
        If n Mod i = 0 Then s = s + i
    Next i
    D = s
End Function

Public Sub PrintAmicablePairs()
    Dim a As Long, b As Long
    For a = 2 To 1499
        b = D(a)
        If b > a Then
            If D(b) = a Then Debug.Print a & " " & b
        End If
    Next a
End Sub
