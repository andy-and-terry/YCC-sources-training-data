Const APP_NAME As String = "Demo"
Const MAX_ROWS As Long = 100
Const PI As Double = 3.14159265358979
Const SECONDS_PER_DAY As Long = 24& * 60 * 60

Enum LogLevel
    llDebug = 0
    llInfo
    llWarn
    llError = 10
End Enum

Private Function LevelName(ByVal lvl As LogLevel) As String
    Select Case lvl
        Case llDebug: LevelName = "DEBUG"
        Case llInfo: LevelName = "INFO"
        Case llWarn: LevelName = "WARN"
        Case llError: LevelName = "ERROR"
    End Select
End Function

Function DaysInMonth(ByVal m As Long, ByVal leap As Boolean) As Long
    Static days As Variant
    If IsEmpty(days) Then
        days = Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    End If
    DaysInMonth = days(m - 1)
    If m = 2 And leap Then DaysInMonth = 29
End Function

Function NextCallNumber() As Long
    Static calls As Long
    calls = calls + 1
    NextCallNumber = calls
End Function

Sub Main()
    Debug.Print APP_NAME, MAX_ROWS, PI
    Debug.Print "seconds per day:", SECONDS_PER_DAY
    Debug.Print "area r=2:", PI * 2 ^ 2
    Debug.Print LevelName(llInfo), LevelName(llError), llWarn, llError + 1
    Debug.Print DaysInMonth(2, False), DaysInMonth(2, True), DaysInMonth(12, False)
    Debug.Print NextCallNumber(), NextCallNumber(), NextCallNumber()
    Debug.Print vbCrLf = Chr$(13) & Chr$(10), vbTab = Chr$(9), vbNullString = ""
    Debug.Print vbYes, vbNo, vbOKOnly, vbBinaryCompare, vbTextCompare
End Sub
