Attribute VB_Name = "MandelbrotAscii"
Function Escape(cr As Double, ci As Double) As Long
    Dim zr As Double, zi As Double, t As Double, n As Long
    Do While n < 30 And zr * zr + zi * zi < 4
        t = zr * zr - zi * zi + cr
        zi = 2 * zr * zi + ci
        zr = t
        n = n + 1
    Loop
    Escape = n
End Function

Sub Main()
    Dim xi As Long, yi As Long, line As String
    For yi = -5 To 5
        line = ""
        For xi = -40 To 12
            line = line & IIf(Escape(xi / 20, yi / 5) = 30, "#", ".")
        Next xi
        Debug.Print line
    Next yi
End Sub
