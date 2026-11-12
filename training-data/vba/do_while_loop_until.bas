Sub Demo()
    Dim n As Long: n = 27: Dim steps As Long
    Do While n <> 1
        n = IIf(n Mod 2 = 0, n \ 2, 3 * n + 1)
        steps = steps + 1
    Loop
    Debug.Print steps
End Sub
