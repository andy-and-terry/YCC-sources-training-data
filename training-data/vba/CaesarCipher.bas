Function CaesarShift(ByVal text As String, ByVal shift As Long) As String
    Dim i As Long, ch As Long, result As String
    shift = ((shift Mod 26) + 26) Mod 26
    For i = 1 To Len(text)
        ch = Asc(Mid$(text, i, 1))
        If ch >= 65 And ch <= 90 Then
            ch = (ch - 65 + shift) Mod 26 + 65
        ElseIf ch >= 97 And ch <= 122 Then
            ch = (ch - 97 + shift) Mod 26 + 97
        End If
        result = result & Chr$(ch)
    Next i
    CaesarShift = result
End Function

Sub Main()
    Dim enc As String
    enc = CaesarShift("Hello, World!", 3)
    Debug.Print enc
    Debug.Print CaesarShift(enc, -3)
End Sub
