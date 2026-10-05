Function CollatzSteps(ByVal n As Long) As Long
    Dim steps As Long
    Do While n <> 1
        If n Mod 2 = 0 Then
            n = n \ 2
        Else
            n = 3 * n + 1
        End If
        steps = steps + 1
    Loop
    CollatzSteps = steps
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 10
        Debug.Print n & " -> " & CollatzSteps(n) & " steps"
    Next n
    Debug.Print "27 -> " & CollatzSteps(27) & " steps"
End Sub
