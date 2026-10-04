Sub Main()
    Dim n As Long

    n = 1
    Do While n < 100
        n = n * 2
    Loop
    Debug.Print "do while: "; n

    n = 1
    Do Until n >= 100
        n = n * 3
    Loop
    Debug.Print "do until: "; n

    n = 500
    Do
        n = n \ 2
    Loop While n > 100
    Debug.Print "loop while: "; n

    Dim i As Long
    Do
        i = i + 1
        If i Mod 2 = 0 Then GoTo Continue
        If i > 9 Then Exit Do
        Debug.Print "odd:"; i
Continue:
    Loop
End Sub
