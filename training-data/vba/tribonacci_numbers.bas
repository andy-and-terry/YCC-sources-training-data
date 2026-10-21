' Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
Sub TribonacciNumbers()
    Dim t(0 To 14) As Long
    Dim i As Long
    Dim s As String

    t(0) = 0: t(1) = 0: t(2) = 1
    For i = 3 To 14
        t(i) = t(i - 1) + t(i - 2) + t(i - 3)
    Next i

    For i = 0 To 14
        s = s & t(i) & " "
    Next i
    Debug.Print "Tribonacci: " & s
End Sub
