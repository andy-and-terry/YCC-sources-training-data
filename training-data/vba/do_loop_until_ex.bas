Function Collatz(n As Long) As Long
    Dim steps As Long
    Do Until n = 1
        If n Mod 2 = 0 Then n = n \ 2 Else n = 3 * n + 1
        steps = steps + 1
    Loop
    Collatz = steps
End Function
