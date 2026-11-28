Function PopCount(ByVal n As Long) As Long
    Dim c As Long
    Do While n <> 0
        n = n And (n - 1)
        c = c + 1
    Loop
    PopCount = c
End Function

Sub Demo()
    Debug.Print PopCount(&HB7), PopCount(255)
End Sub
