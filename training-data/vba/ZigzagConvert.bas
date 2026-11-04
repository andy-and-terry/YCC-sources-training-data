Attribute VB_Name = "ZigzagConvert"
Option Explicit

Public Function Zigzag(ByVal s As String, ByVal rows As Long) As String
    Dim lines() As String, r As Long, stepDir As Long, i As Long
    If rows = 1 Or rows >= Len(s) Then Zigzag = s: Exit Function
    ReDim lines(0 To rows - 1)
    r = 0: stepDir = 1
    For i = 1 To Len(s)
        lines(r) = lines(r) & Mid$(s, i, 1)
        If r = 0 Then
            stepDir = 1
        ElseIf r = rows - 1 Then
            stepDir = -1
        End If
        r = r + stepDir
    Next i
    Zigzag = Join(lines, "")
End Function

Public Sub DemoZigzag()
    Debug.Print Zigzag("PAYPALISHIRING", 3)
End Sub
