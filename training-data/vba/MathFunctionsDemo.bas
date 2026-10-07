Sub Main()
    Debug.Print Abs(-4.5)
    Debug.Print Sqr(144)
    Debug.Print Sgn(-9); Sgn(0); Sgn(3)
    Debug.Print Round(2.567, 2); Round(2.5); Round(3.5)
    Debug.Print Exp(1)
    Debug.Print Log(100) / Log(10)
    Debug.Print 2 ^ 10
    Debug.Print Atn(1) * 4

    Randomize 42
    Dim i As Long
    For i = 1 To 3
        Debug.Print Int(Rnd * 6) + 1;
    Next i
    Debug.Print
End Sub
