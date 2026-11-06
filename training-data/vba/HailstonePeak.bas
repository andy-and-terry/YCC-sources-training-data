' Highest value reached by the Collatz (hailstone) sequence from n.
Public Function Peak(ByVal n As Double) As Double
    Dim best As Double
    best = n
    Do While n <> 1
        If n - 2 * Int(n / 2) = 0 Then
            n = n / 2
        Else
            n = 3 * n + 1
        End If
        If n > best Then best = n
    Loop
    Peak = best
End Function

Public Sub RunPeak()
    Debug.Print Peak(27)
End Sub
