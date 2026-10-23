Sub Main()
    Dim s(0 To 19) As Long
    Dim n As Long, result As String
    s(1) = 1
    For n = 2 To 19
        If n Mod 2 = 0 Then
            s(n) = s(n \ 2)
        Else
            s(n) = s(n \ 2) + s(n \ 2 + 1)
        End If
    Next n
    result = CStr(s(0))
    For n = 1 To 19
        result = result & " " & s(n)
    Next n
    Debug.Print result
End Sub
