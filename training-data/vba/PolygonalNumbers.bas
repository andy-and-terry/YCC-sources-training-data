Function Polygonal(s As Long, n As Long) As Long
    Polygonal = ((s - 2) * n * n - (s - 4) * n) \ 2
End Function

Sub PrintFirstTen(title As String, s As Long)
    Dim n As Long, result As String
    For n = 1 To 10
        result = result & Polygonal(s, n) & " "
    Next n
    Debug.Print title & ": " & Trim(result)
End Sub

Sub Main()
    PrintFirstTen "triangular", 3
    PrintFirstTen "pentagonal", 5
    PrintFirstTen "hexagonal", 6
End Sub
