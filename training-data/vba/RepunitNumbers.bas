' Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
Public Sub Main()
    Dim r As Currency, n As Long
    r = 0
    For n = 1 To 8
        r = r * 10 + 1
        If r - 3 * Int(r / 3) = 0 Then
            Debug.Print r & "  (divisible by 3)"
        Else
            Debug.Print r
        End If
    Next n
End Sub
