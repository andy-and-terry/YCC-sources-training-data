Function BuildLps(pattern As String) As Long()
    Dim n As Long, len_ As Long, i As Long
    n = Len(pattern)
    Dim lps() As Long
    ReDim lps(n - 1)
    len_ = 0
    i = 1
    Do While i < n
        If Mid(pattern, i + 1, 1) = Mid(pattern, len_ + 1, 1) Then
            len_ = len_ + 1
            lps(i) = len_
            i = i + 1
        ElseIf len_ <> 0 Then
            len_ = lps(len_ - 1)
        Else
            lps(i) = 0
            i = i + 1
        End If
    Loop
    BuildLps = lps
End Function

Function KmpSearch(text As String, pattern As String) As Long
    Dim lps() As Long
    lps = BuildLps(pattern)
    Dim n As Long, m As Long, i As Long, j As Long
    n = Len(text)
    m = Len(pattern)
    i = 0: j = 0
    Do While i < n
        If Mid(text, i + 1, 1) = Mid(pattern, j + 1, 1) Then
            i = i + 1: j = j + 1
            If j = m Then
                KmpSearch = i - j
                Exit Function
            End If
        ElseIf j > 0 Then
            j = lps(j - 1)
        Else
            i = i + 1
        End If
    Loop
    KmpSearch = -1
End Function

Sub Main()
    Debug.Print KmpSearch("abxabcabcaby", "abcaby")
End Sub
