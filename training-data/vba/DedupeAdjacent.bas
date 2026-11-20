' Remove consecutive duplicate characters.
Public Function Dedupe(s As String) As String
    Dim i As Long
    For i = 1 To Len(s)
        If i = 1 Then
            Dedupe = Mid$(s, 1, 1)
        ElseIf Mid$(s, i, 1) <> Mid$(s, i - 1, 1) Then
            Dedupe = Dedupe & Mid$(s, i, 1)
        End If
    Next i
End Function
