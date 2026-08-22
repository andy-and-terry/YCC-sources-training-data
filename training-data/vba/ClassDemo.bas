' Class module: Point
Public X As Double
Public Y As Double

Public Function InitPoint(ByVal x As Double, ByVal y As Double) As Object
    Me.X = x
    Me.Y = y
    Set InitPoint = Me
End Function

Public Function AddPoint(ByRef other As Object) As Double()
    Dim result(1) As Double
    result(0) = Me.X + other.X
    result(1) = Me.Y + other.Y
    AddPoint = result
End Function
