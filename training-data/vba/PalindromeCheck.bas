Function IsPalindrome(s As String) As Boolean
    Dim normalized As String, i As Long, c As String
    normalized = ""
    For i = 1 To Len(s)
        c = LCase(Mid(s, i, 1))
        If c Like "[a-z0-9]" Then
            normalized = normalized & c
        End If
    Next i
    IsPalindrome = (normalized = StrReverse(normalized))
End Function

Sub Main()
    Debug.Print IsPalindrome("A man, a plan, a canal: Panama")
    Debug.Print IsPalindrome("hello")
End Sub
