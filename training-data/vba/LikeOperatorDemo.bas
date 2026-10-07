Function MatchesPattern(text As String, pattern As String) As Boolean
    MatchesPattern = (text Like pattern)
End Function

Sub Main()
    Debug.Print MatchesPattern("report_2024.xlsx", "report_*.xlsx")
    Debug.Print MatchesPattern("invoice.pdf", "report_*.xlsx")
    Debug.Print MatchesPattern("A123", "[A-Z]###")
End Sub
