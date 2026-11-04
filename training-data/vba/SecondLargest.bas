Attribute VB_Name = "SecondLargest"
Option Explicit

Public Function SecondLargestValue(values As Variant) As Variant
    Dim first As Double, second As Double, haveSecond As Boolean, i As Long, x As Double
    first = values(LBound(values))
    For i = LBound(values) + 1 To UBound(values)
        x = values(i)
        If x > first Then
            second = first: haveSecond = True: first = x
        ElseIf x < first And (Not haveSecond Or x > second) Then
            second = x: haveSecond = True
        End If
    Next i
    If haveSecond Then SecondLargestValue = second Else SecondLargestValue = Null
End Function

Public Sub DemoSecond()
    Debug.Print SecondLargestValue(Array(4, 9, 2, 9, 7))
End Sub
