Function ExpandFromCenter(s As String, left As Long, right As Long) As String
    Do While left >= 1 And right <= Len(s) And Mid(s, left, 1) = Mid(s, right, 1)
        left = left - 1
        right = right + 1
    Loop
    ExpandFromCenter = Mid(s, left + 1, right - left - 1)
End Function

Function LongestPalindrome(s As String) As String
    Dim best As String
    Dim i As Long
    Dim candidate1 As String, candidate2 As String

    best = ""
    For i = 1 To Len(s)
        candidate1 = ExpandFromCenter(s, i, i)
        candidate2 = ExpandFromCenter(s, i, i + 1)

        If Len(candidate1) > Len(best) Then best = candidate1
        If Len(candidate2) > Len(best) Then best = candidate2
    Next i

    LongestPalindrome = best
End Function

Sub Main()
    Debug.Print LongestPalindrome("babad")
    Debug.Print LongestPalindrome("cbbd")
End Sub
