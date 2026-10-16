Function ReverseWords(ByVal s As String) As String
    Dim parts() As String
    Dim i As Long
    Dim result As String
    parts = Split(Trim$(s), " ")
    For i = UBound(parts) To LBound(parts) Step -1
        If Len(parts(i)) > 0 Then
            If Len(result) > 0 Then result = result & " "
            result = result & parts(i)
        End If
    Next i
    ReverseWords = result
End Function

Sub Main()
    Debug.Print ReverseWords("the quick brown fox")
    Debug.Print ReverseWords("  spaced   out  ")
End Sub
