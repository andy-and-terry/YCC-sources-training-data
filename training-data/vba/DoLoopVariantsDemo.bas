Sub Main()
    Dim i As Long
    Dim total As Long

    i = 1
    Do While i <= 5
        total = total + i
        i = i + 1
    Loop
    Debug.Print "Do While:", total

    i = 10
    Do Until i <= 0
        i = i - 3
    Loop
    Debug.Print "Do Until:", i

    i = 100
    Do
        i = i + 1
    Loop While i < 50
    Debug.Print "Do...Loop While (runs once):", i

    i = 0
    Do
        i = i + 1
        If i Mod 2 = 0 Then GoTo Continue
        If i > 9 Then Exit Do
        Debug.Print "odd", i
Continue:
    Loop

    Dim n As Long: n = 27
    Dim steps As Long
    Do Until n = 1
        If n Mod 2 = 0 Then n = n \ 2 Else n = 3 * n + 1
        steps = steps + 1
    Loop
    Debug.Print "Collatz steps for 27:", steps

    Dim k As Long
    While k < 3
        k = k + 1
    Wend
    Debug.Print "While...Wend:", k
End Sub
