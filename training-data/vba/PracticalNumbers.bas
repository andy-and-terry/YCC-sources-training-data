' Practical numbers: every m in 1..n is a sum of distinct divisors of n.
' reach(i) = True when i is a subset sum of the divisors seen so far.
Private Function IsPractical(ByVal n As Long) As Boolean
    Dim reach() As Boolean
    Dim d As Long, i As Long
    ReDim reach(0 To n)
    reach(0) = True
    For d = 1 To n
        If n Mod d = 0 Then
            For i = n To d Step -1
                If reach(i - d) Then reach(i) = True
            Next i
        End If
    Next d
    For i = 1 To n
        If Not reach(i) Then Exit Function
    Next i
    IsPractical = True
End Function

Public Sub PracticalNumbers()
    Dim n As Long, out As String
    For n = 1 To 40
        If IsPractical(n) Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
