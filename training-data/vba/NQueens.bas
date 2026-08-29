Function IsSafe(queens() As Long, count As Long, col As Long) As Boolean
    Dim i As Long, dist As Long
    For i = 0 To count - 1
        dist = count - i
        If queens(i) = col Or Abs(queens(i) - col) = dist Then
            IsSafe = False
            Exit Function
        End If
    Next i
    IsSafe = True
End Function

Function Solve(queens() As Long, count As Long, n As Long) As Long
    If count = n Then
        Solve = 1
        Exit Function
    End If
    Dim total As Long, col As Long
    total = 0
    For col = 0 To n - 1
        If IsSafe(queens, count, col) Then
            queens(count) = col
            total = total + Solve(queens, count + 1, n)
        End If
    Next col
    Solve = total
End Function

Sub Main()
    Dim queens(6) As Long
    Debug.Print Solve(queens, 0, 6)
End Sub
