Function ClassifyTriangle(ByVal a As Double, ByVal b As Double, ByVal c As Double) As String
    If a <= 0 Or b <= 0 Or c <= 0 Then
        ClassifyTriangle = "invalid"
    ElseIf a + b <= c Or a + c <= b Or b + c <= a Then
        ClassifyTriangle = "not a triangle"
    ElseIf a = b And b = c Then
        ClassifyTriangle = "equilateral"
    ElseIf a = b Or b = c Or a = c Then
        ClassifyTriangle = "isosceles"
    Else
        ClassifyTriangle = "scalene"
    End If
End Function

Sub Main()
    Debug.Print ClassifyTriangle(3, 3, 3)
    Debug.Print ClassifyTriangle(3, 3, 5)
    Debug.Print ClassifyTriangle(3, 4, 5)
    Debug.Print ClassifyTriangle(1, 2, 3)
    Debug.Print ClassifyTriangle(0, 2, 3)
End Sub
