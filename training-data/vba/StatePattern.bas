Const STATE_RED As Long = 0
Const STATE_GREEN As Long = 1
Const STATE_YELLOW As Long = 2

Function StateName(state As Long) As String
    Select Case state
        Case STATE_RED: StateName = "red"
        Case STATE_GREEN: StateName = "green"
        Case STATE_YELLOW: StateName = "yellow"
    End Select
End Function

Function NextState(state As Long) As Long
    Select Case state
        Case STATE_RED: NextState = STATE_GREEN
        Case STATE_GREEN: NextState = STATE_YELLOW
        Case STATE_YELLOW: NextState = STATE_RED
    End Select
End Function

Sub Main()
    Dim state As Long
    state = STATE_RED

    Dim i As Long
    For i = 1 To 5
        Debug.Print "light is " & StateName(state)
        state = NextState(state)
    Next i
End Sub
