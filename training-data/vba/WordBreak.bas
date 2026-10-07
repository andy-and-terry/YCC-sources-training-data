Function InDictionary(word As String, dict() As String, dictCount As Long) As Boolean
    Dim i As Long
    For i = 0 To dictCount - 1
        If dict(i) = word Then
            InDictionary = True
            Exit Function
        End If
    Next i
    InDictionary = False
End Function

Function WordBreak(s As String, dict() As String, dictCount As Long) As Boolean
    Dim n As Long
    n = Len(s)
    Dim dp() As Boolean
    ReDim dp(0 To n)
    dp(0) = True

    Dim i As Long, j As Long
    For i = 1 To n
        For j = 0 To i - 1
            If dp(j) And InDictionary(Mid(s, j + 1, i - j), dict, dictCount) Then
                dp(i) = True
                Exit For
            End If
        Next j
    Next i

    WordBreak = dp(n)
End Function

Sub Main()
    Dim dict(3) As String
    dict(0) = "leet": dict(1) = "code": dict(2) = "sand": dict(3) = "dog"

    Debug.Print WordBreak("leetcode", dict, 4)
    Debug.Print WordBreak("catsanddog", dict, 4)
End Sub
