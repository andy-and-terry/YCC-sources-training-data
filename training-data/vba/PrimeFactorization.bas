Function PrimeFactors(n As Long) As String
    Dim result As String
    Dim value As Long, divisor As Long
    value = n
    divisor = 2
    result = ""

    Do While value > 1
        Do While value Mod divisor = 0
            If Len(result) > 0 Then result = result & " x "
            result = result & divisor
            value = value \ divisor
        Loop
        divisor = divisor + 1
        If divisor * divisor > value And value > 1 Then
            If Len(result) > 0 Then result = result & " x "
            result = result & value
            value = 1
        End If
    Loop

    PrimeFactors = result
End Function

Sub Main()
    Debug.Print PrimeFactors(360)
    Debug.Print PrimeFactors(97)
End Sub
