Function AffineEncrypt(text As String, a As Long, b As Long) As String
    Dim i As Long, code As Long
    For i = 1 To Len(text)
        code = Asc(Mid$(text, i, 1))
        If code >= 65 And code <= 90 Then code = 65 + (a * (code - 65) + b) Mod 26
        AffineEncrypt = AffineEncrypt & Chr$(code)
    Next i
End Function

Sub Demo()
    Debug.Print AffineEncrypt("AFFINE", 5, 8)
End Sub
