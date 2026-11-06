' Integer (1..3999) to Roman numeral using a greedy table.
Public Function ToRoman(ByVal n As Long) As String
    Dim values As Variant, symbols As Variant
    Dim i As Long, out As String
    values = Array(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
    symbols = Array("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")
    For i = LBound(values) To UBound(values)
        Do While n >= values(i)
            out = out & symbols(i)
            n = n - values(i)
        Loop
    Next i
    ToRoman = out
End Function

Public Sub RunToRoman()
    Debug.Print ToRoman(1994) & " " & ToRoman(58)
End Sub
