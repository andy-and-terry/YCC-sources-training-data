Sub CountLetters(ByVal s As String, ByRef vowels As Long, ByRef consonants As Long)
    Dim i As Long, c As String
    vowels = 0: consonants = 0
    For i = 1 To Len(s)
        c = LCase$(Mid$(s, i, 1))
        If c Like "[a-z]" Then
            If InStr("aeiou", c) > 0 Then
                vowels = vowels + 1
            Else
                consonants = consonants + 1
            End If
        End If
    Next i
End Sub

Sub Main()
    Dim v As Long, c As Long
    CountLetters "Visual Basic for Applications", v, c
    Debug.Print "Vowels: " & v & ", Consonants: " & c
End Sub
