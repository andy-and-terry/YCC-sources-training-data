' Ways to write n as a sum of two or more consecutive positive integers.
Function PoliteWays(n As Long) As Long
    Dim k As Long
    k = 2
    Do While k * (k + 1) \ 2 <= n
        If (n - k * (k - 1) \ 2) Mod k = 0 Then PoliteWays = PoliteWays + 1
        k = k + 1
    Loop
End Function

Sub PrintPolite()
    Dim n As Long, out As String
    For n = 1 To 16
        out = out & PoliteWays(n) & " "
    Next n
    Debug.Print Trim(out)
End Sub
