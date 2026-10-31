Function CubeFromOdds(n As Long) As Long
    Dim start As Long, i As Long, total As Long
    start = n * n - n + 1
    For i = 0 To n - 1
        total = total + start + 2 * i
    Next i
    CubeFromOdds = total
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 5
        Debug.Print n; CubeFromOdds(n); (CubeFromOdds(n) = n * n * n)
    Next n
End Sub
