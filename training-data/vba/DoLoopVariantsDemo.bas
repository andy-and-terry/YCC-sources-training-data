Sub Main()
    Dim n As Long

    n = 1
    Do While n < 100
        n = n * 2
    Loop
    Debug.Print "While: " & n

    n = 100
    Do Until n < 10
        n = n \ 3
    Loop
    Debug.Print "Until: " & n

    n = 50
    Do
        n = n + 1
    Loop While n < 10
    Debug.Print "Post-test: " & n

    Dim i As Long
    For i = 1 To 100
        If i * i > 50 Then Exit For
    Next i
    Debug.Print "First i with i^2 > 50: " & i

    For i = 10 To 1 Step -3
        Debug.Print i;
    Next i
    Debug.Print
End Sub
