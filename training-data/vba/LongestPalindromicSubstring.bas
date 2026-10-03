Function ExpandAroundCenter(s As String, left As Long, right As Long) As String
    Dim n As Long
    n = Len(s)
    Do While left >= 1 And right <= n And Mid(s, left, 1) = Mid(s, right, 1)
        left = left - 1
        right = right + 1
    Loop
    ExpandAroundCenter = Mid(s, left + 1, right - left - 1)
End Function

Function LongestPalindrome(s As String) As String
    Dim best As String
    best = ""
    Dim i As Long
    For i = 1 To Len(s)
        Dim odd_ As String, even_ As String
        odd_ = ExpandAroundCenter(s, i, i)
        If Len(odd_) > Len(best) Then best = odd_
        even_ = ExpandAroundCenter(s, i, i + 1)
        If Len(even_) > Len(best) Then best = even_
    Next i
    LongestPalindrome = best
End Function

Sub Main()
    Debug.Print LongestPalindrome("babad")
    Debug.Print LongestPalindrome("cbbd")
End Sub
