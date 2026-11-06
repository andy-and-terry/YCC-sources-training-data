' Bulls and Cows scoring for equal-length digit strings.
Public Sub Score(ByVal secret As String, ByVal guess As String, _
                 ByRef bulls As Long, ByRef cows As Long)
    Dim sc(0 To 9) As Long, gc(0 To 9) As Long
    Dim i As Long, d As Long
    bulls = 0: cows = 0
    For i = 1 To Len(secret)
        If Mid$(secret, i, 1) = Mid$(guess, i, 1) Then
            bulls = bulls + 1
        Else
            sc(CInt(Mid$(secret, i, 1))) = sc(CInt(Mid$(secret, i, 1))) + 1
            gc(CInt(Mid$(guess, i, 1))) = gc(CInt(Mid$(guess, i, 1))) + 1
        End If
    Next i
    For d = 0 To 9
        If sc(d) < gc(d) Then cows = cows + sc(d) Else cows = cows + gc(d)
    Next d
End Sub

Public Sub RunBullsAndCows()
    Dim b As Long, c As Long
    Score "1807", "7810", b, c
    Debug.Print b & " bull(s), " & c & " cow(s)"
End Sub
