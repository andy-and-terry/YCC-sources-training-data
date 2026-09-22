Function ArraySum(values() As Double) As Double
    ArraySum = Application.WorksheetFunction.Sum(values)
End Function

Function ArrayMax(values() As Double) As Double
    ArrayMax = Application.WorksheetFunction.Max(values)
End Function

Function FindPosition(target As Double, values() As Double) As Long
    FindPosition = Application.WorksheetFunction.Match(target, values, 0)
End Function

Sub Main()
    Dim data(4) As Double
    data(0) = 4.5: data(1) = 2.1: data(2) = 9.3: data(3) = 7.7: data(4) = 1.2

    Debug.Print ArraySum(data)
    Debug.Print ArrayMax(data)
    Debug.Print FindPosition(9.3, data)
End Sub
