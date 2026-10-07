' Class module: IShape
Public Function Area() As Double
End Function

' Class module: CircleShape
Implements IShape
Public Radius As Double

Private Function IShape_Area() As Double
    IShape_Area = 3.14159265 * Radius * Radius
End Function

' Class module: SquareShape
Implements IShape
Public Side As Double

Private Function IShape_Area() As Double
    IShape_Area = Side * Side
End Function

' The following would live in a standard module
Function ShapeFactory(kind As String, param As Double) As IShape
    Select Case kind
        Case "circle"
            Dim c As New CircleShape
            c.Radius = param
            Set ShapeFactory = c
        Case "square"
            Dim s As New SquareShape
            s.Side = param
            Set ShapeFactory = s
        Case Else
            Err.Raise vbObjectError + 1, , "Unknown shape kind: " & kind
    End Select
End Function

Sub Main()
    Dim circle As IShape, square As IShape
    Set circle = ShapeFactory("circle", 3)
    Set square = ShapeFactory("square", 4)

    Debug.Print "circle area: " & circle.Area
    Debug.Print "square area: " & square.Area
End Sub
