' Amicable pairs below 1500 via sums of proper divisors.
Private Function S(ByVal n As Long) As Long
    Dim d As Long, t As Long
    For d = 1 To n - 1
        If n Mod d = 0 Then t = t + d
    Next d
    S = t
End Function

Public Sub AmicablePairs()
    Dim a As Long, b As Long
    For a = 2 To 1499
        b = S(a)
        If b > a Then
            If S(b) = a Then Debug.Print a & " " & b
        End If
    Next a
End Sub
