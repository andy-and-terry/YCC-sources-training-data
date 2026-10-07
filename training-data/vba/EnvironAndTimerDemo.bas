Sub Main()
    Dim t As Single
    Dim i As Long
    Dim total As Double

    t = Timer
    For i = 1 To 1000000
        total = total + Sqr(i)
    Next i
    Debug.Print "elapsed (s): "; Format$(Timer - t, "0.000")
    Debug.Print "total: "; Format$(total, "#,##0")

    Debug.Print "has PATH: "; (Len(Environ$("PATH")) > 0)
    Debug.Print Format$(Now, "yyyy-mm-dd") <> ""
End Sub
