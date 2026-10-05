Function FindPair(sorted() As Long, ByVal target As Long) As String
    Dim left As Long, right As Long, total As Long
    left = LBound(sorted)
    right = UBound(sorted)
    Do While left < right
        total = sorted(left) + sorted(right)
        If total = target Then
            FindPair = sorted(left) & " + " & sorted(right)
            Exit Function
        ElseIf total < target Then
            left = left + 1
        Else
            right = right - 1
        End If
    Loop
    FindPair = "none"
End Function

Sub Main()
    Dim data(0 To 5) As Long
    data(0) = 1: data(1) = 3: data(2) = 4
    data(3) = 6: data(4) = 8: data(5) = 11
    Debug.Print FindPair(data, 10)
    Debug.Print FindPair(data, 100)
End Sub
