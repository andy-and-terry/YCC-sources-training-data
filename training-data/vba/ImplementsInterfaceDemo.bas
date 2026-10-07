' Class module: IShape
Public Function Area() As Double
End Function

' Class module: Circle
Implements IShape

Public Radius As Double

Private Function IShape_Area() As Double
    IShape_Area = 3.14159265 * Radius * Radius
End Function

' Class module: Square
Implements IShape

Public Side As Double

Private Function IShape_Area() As Double
    IShape_Area = Side * Side
End Function

' The following would live in a standard module
Sub Main()
    Dim shapes As New Collection
    Dim c As New Circle
    c.Radius = 2
    Dim s As New Square
    s.Side = 3

    shapes.Add c
    shapes.Add s

    Dim shp As IShape
    Dim item As Variant
    For Each item In shapes
        Set shp = item
        Debug.Print shp.Area
    Next item
End Sub
