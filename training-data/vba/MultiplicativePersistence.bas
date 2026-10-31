Function Persistence(ByVal n As Long) As Long
    Dim steps As Long, product As Long
    Do While n >= 10
        product = 1
        Do While n > 0
            product = product * (n Mod 10)
            n = n \ 10
        Loop
        n = product
        steps = steps + 1
    Loop
    Persistence = steps
End Function

Sub Main()
    Debug.Print 39; Persistence(39)
    Debug.Print 77; Persistence(77)
    Debug.Print 999; Persistence(999)
    Debug.Print 10; Persistence(10)
End Sub
