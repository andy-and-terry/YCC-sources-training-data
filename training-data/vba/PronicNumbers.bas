Function IsPronic(ByVal x As Long) As Boolean
    Dim n As Long
    n = Int(Sqr(x))
    IsPronic = (n * (n + 1) = x)
End Function

Sub ShowPronic()
    Dim n As Long, out As String
    For n = 0 To 9
        out = out & n * (n + 1) & " "
    Next n
    Debug.Print out ' 0 2 6 12 20 30 42 56 72 90
    Debug.Print IsPronic(56), IsPronic(57) ' True False
End Sub
