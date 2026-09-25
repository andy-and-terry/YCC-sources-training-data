Function CsvToPipeDelimited(csvLine As String) As String
    Dim parts() As String
    parts = Split(csvLine, ",")
    CsvToPipeDelimited = Join(parts, "|")
End Function

Sub Main()
    Debug.Print CsvToPipeDelimited("apple,banana,cherry")

    Dim words() As String
    words = Split("the quick brown fox", " ")
    Debug.Print UBound(words) - LBound(words) + 1
    Debug.Print Join(words, "-")
End Sub
