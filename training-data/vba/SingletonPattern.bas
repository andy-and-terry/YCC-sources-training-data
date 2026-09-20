' Class module: AppConfig
Public Counter As Long

' --- Standard module (references the AppConfig class module above) ---
Private mInstance As AppConfig

Public Function GetAppConfig() As AppConfig
    If mInstance Is Nothing Then
        Set mInstance = New AppConfig
    End If
    Set GetAppConfig = mInstance
End Function

Sub Main()
    Dim a As AppConfig
    Dim b As AppConfig

    Set a = GetAppConfig()
    a.Counter = a.Counter + 1
    a.Counter = a.Counter + 1

    Set b = GetAppConfig()
    b.Counter = b.Counter + 1

    Debug.Print a.Counter        ' 3 - both variables share one instance
    Debug.Print (a Is b)         ' True
End Sub
