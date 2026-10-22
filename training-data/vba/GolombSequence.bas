Sub Main()
    Dim a(1 To 20) As Long
    Dim n As Long, result As String
    a(1) = 1
    For n = 2 To 20
        a(n) = 1 + a(n - a(a(n - 1)))
    Next n
    For n = 1 To 20
        result = result & a(n) & " "
    Next n
    Debug.Print Trim(result)
End Sub
