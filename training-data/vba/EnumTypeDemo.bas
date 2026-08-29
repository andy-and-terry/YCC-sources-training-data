Enum Direction
    North = 0
    South = 1
    East = 2
    West = 3
End Enum

Function DescribeDirection(d As Direction) As String
    Select Case d
        Case North
            DescribeDirection = "going up"
        Case South
            DescribeDirection = "going down"
        Case East
            DescribeDirection = "going right"
        Case West
            DescribeDirection = "going left"
    End Select
End Function

Sub Main()
    Debug.Print DescribeDirection(North)
    Debug.Print DescribeDirection(West)
End Sub
