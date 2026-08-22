Function WordCount(ByVal text As String) As Long
    Dim words() As String
    words = Split(Trim(text), " ")
    WordCount = UBound(words) - LBound(words) + 1
End Function

Sub Main()
    Dim sample As String
    sample = "the quick brown fox jumps over the lazy dog"
    Debug.Print WordCount(sample)
End Sub
