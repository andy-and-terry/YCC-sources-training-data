' Class module: Logger
Private m_Name As String

Private Sub Class_Initialize()
    m_Name = "Logger"
    Debug.Print m_Name & " initialized"
End Sub

Private Sub Class_Terminate()
    Debug.Print m_Name & " terminated"
End Sub

Public Sub Log(ByVal message As String)
    Debug.Print "[" & m_Name & "] " & message
End Sub

' The following would live in a standard module
Sub Main()
    Dim lg As New Logger
    lg.Log "starting work"
    lg.Log "finishing work"
    Set lg = Nothing
End Sub
