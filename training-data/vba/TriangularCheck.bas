' n is triangular iff 8n + 1 is a perfect square.
Function IsTriangular(n As Long) As Boolean
    Dim s As Long, r As Long
    s = 8 * n + 1
    r = CLng(Sqr(s))
    IsTriangular = (r * r = s)
End Function

Sub PrintTriangular()
    Dim n As Long, out As String
    For n = 0 To 20
        If IsTriangular(n) Then out = out & n & " "
    Next n
    Debug.Print Trim(out)
End Sub
