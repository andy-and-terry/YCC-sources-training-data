Function LongestCommonSubsequence(a As String, b As String) As String
    Dim m As Long, n As Long
    m = Len(a)
    n = Len(b)
    Dim table(100, 100) As Long
    Dim i As Long, j As Long
    For i = 1 To m
        For j = 1 To n
            If Mid(a, i, 1) = Mid(b, j, 1) Then
                table(i, j) = table(i - 1, j - 1) + 1
            ElseIf table(i - 1, j) >= table(i, j - 1) Then
                table(i, j) = table(i - 1, j)
            Else
                table(i, j) = table(i, j - 1)
            End If
        Next j
    Next i

    Dim result As String
    result = ""
    i = m
    j = n
    Do While i > 0 And j > 0
        If Mid(a, i, 1) = Mid(b, j, 1) Then
            result = Mid(a, i, 1) & result
            i = i - 1
            j = j - 1
        ElseIf table(i - 1, j) >= table(i, j - 1) Then
            i = i - 1
        Else
            j = j - 1
        End If
    Loop
    LongestCommonSubsequence = result
End Function

Sub Main()
    Debug.Print LongestCommonSubsequence("ABCBDAB", "BDCABA")
End Sub
