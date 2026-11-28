Private Function Fact(ByVal n As Long) As Double
    Dim i As Long
    Fact = 1
    For i = 2 To n
        Fact = Fact * i
    Next i
End Function

Public Function Lah(ByVal n As Long, ByVal k As Long) As Double
    Lah = Fact(n - 1) / (Fact(k - 1) * Fact(n - k)) * Fact(n) / Fact(k)
End Function

Public Sub Main()
    Dim n As Long, k As Long, row As String
    For n = 1 To 5
        row = ""
        For k = 1 To n
            row = row & Lah(n, k) & " "
        Next k
        Debug.Print row
    Next n
End Sub
