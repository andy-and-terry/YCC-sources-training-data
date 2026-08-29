Function ToRoman(n As Long) As String
    Dim values(12) As Long
    Dim symbols(12) As String
    values(0) = 1000: symbols(0) = "M"
    values(1) = 900: symbols(1) = "CM"
    values(2) = 500: symbols(2) = "D"
    values(3) = 400: symbols(3) = "CD"
    values(4) = 100: symbols(4) = "C"
    values(5) = 90: symbols(5) = "XC"
    values(6) = 50: symbols(6) = "L"
    values(7) = 40: symbols(7) = "XL"
    values(8) = 10: symbols(8) = "X"
    values(9) = 9: symbols(9) = "IX"
    values(10) = 5: symbols(10) = "V"
    values(11) = 4: symbols(11) = "IV"
    values(12) = 1: symbols(12) = "I"

    Dim result As String, remaining As Long, i As Long
    result = ""
    remaining = n
    For i = 0 To 12
        Do While remaining >= values(i)
            result = result & symbols(i)
            remaining = remaining - values(i)
        Loop
    Next i
    ToRoman = result
End Function

Sub Main()
    Debug.Print ToRoman(1994)
End Sub
