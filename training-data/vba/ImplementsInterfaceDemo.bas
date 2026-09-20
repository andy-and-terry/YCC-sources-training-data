' Class module: IShape (interface - every method body is left empty)
Public Function Area() As Double
End Function

' Class module: Circle
Implements IShape
Private mRadius As Double

Public Sub Init(ByVal radius As Double)
    mRadius = radius
End Sub

Private Function IShape_Area() As Double
    IShape_Area = 3.14159265 * mRadius * mRadius
End Function

' Class module: Square
Implements IShape
Private mSide As Double

Public Sub InitSquare(ByVal side As Double)
    mSide = side
End Sub

Private Function IShape_Area() As Double
    IShape_Area = mSide * mSide
End Function

' --- Standard module (references IShape/Circle/Square above) ---
Sub Main()
    Dim c As New Circle
    c.Init 2

    Dim s As New Square
    s.InitSquare 3

    Dim shapes(1) As IShape
    Set shapes(0) = c
    Set shapes(1) = s

    Dim i As Integer
    For i = 0 To 1
        Debug.Print shapes(i).Area
    Next i
End Sub
