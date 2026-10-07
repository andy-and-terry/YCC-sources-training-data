Function RabinKarpSearch(text As String, pattern As String) As Long
    Dim n As Long, m As Long
    n = Len(text)
    m = Len(pattern)
    If m = 0 Or m > n Then
        RabinKarpSearch = -1
        Exit Function
    End If

    Dim base As Long, modulus As Long
    base = 256
    modulus = 101

    Dim patternHash As Long, windowHash As Long, highOrder As Long
    Dim i As Long

    highOrder = 1
    For i = 1 To m - 1
        highOrder = (highOrder * base) Mod modulus
    Next i

    patternHash = 0
    windowHash = 0
    For i = 1 To m
        patternHash = (patternHash * base + Asc(Mid(pattern, i, 1))) Mod modulus
        windowHash = (windowHash * base + Asc(Mid(text, i, 1))) Mod modulus
    Next i

    For i = 1 To n - m + 1
        If windowHash = patternHash Then
            If Mid(text, i, m) = pattern Then
                RabinKarpSearch = i
                Exit Function
            End If
        End If
        If i < n - m + 1 Then
            windowHash = ((windowHash - Asc(Mid(text, i, 1)) * highOrder) * base + Asc(Mid(text, i + m, 1))) Mod modulus
            If windowHash < 0 Then windowHash = windowHash + modulus
        End If
    Next i

    RabinKarpSearch = -1
End Function

Sub Main()
    Debug.Print RabinKarpSearch("abxabcabcaby", "abcaby")
    Debug.Print RabinKarpSearch("hello world", "world")
    Debug.Print RabinKarpSearch("hello world", "xyz")
End Sub
