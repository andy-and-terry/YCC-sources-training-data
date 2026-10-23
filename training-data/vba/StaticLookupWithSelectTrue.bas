Option Explicit

Function BmiCategory(ByVal bmi As Double) As String
    Select Case True
        Case bmi < 18.5: BmiCategory = "Underweight"
        Case bmi < 25:   BmiCategory = "Normal"
        Case bmi < 30:   BmiCategory = "Overweight"
        Case Else:       BmiCategory = "Obese"
    End Select
End Function

Sub BmiDemo()
    Dim v As Variant
    For Each v In Array(17.2, 22.4, 27.9, 33#)
        Debug.Print v & " -> " & BmiCategory(CDbl(v))
    Next v
End Sub
