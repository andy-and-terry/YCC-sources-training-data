Sub Main()
    Dim i As Long

    i = 0
    Do While i < 3
        Debug.Print "while: "; i
        i = i + 1
    Loop

    i = 10
    Do Until i <= 7
        Debug.Print "until: "; i
        i = i - 1
    Loop

    i = 100
    Do
        Debug.Print "runs once: "; i
        i = i + 1
    Loop While i < 100

    i = 0
    Do
        i = i + 1
        If i = 2 Then GoTo Skip
        If i > 4 Then Exit Do
        Debug.Print "body: "; i
Skip:
    Loop
End Sub
