Private Function Cake(ByVal n As Long) As Long
    Cake = (n * n * n + 5 * n + 6) \ 6
End Function

Sub PrintCakeNumbers()
    Dim n As Long, s As String
    For n = 0 To 9
        s = s & Cake(n) & " "
    Next n
    Debug.Print s ' 1 2 4 8 15 26 42 64 93 130
End Sub
