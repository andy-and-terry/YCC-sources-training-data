Sub Main()
    Dim q(1 To 20) As Long
    Dim n As Long, result As String
    q(1) = 1
    q(2) = 1
    For n = 3 To 20
        q(n) = q(n - q(n - 1)) + q(n - q(n - 2))
    Next n
    For n = 1 To 20
        result = result & q(n) & " "
    Next n
    Debug.Print Trim(result)
End Sub
