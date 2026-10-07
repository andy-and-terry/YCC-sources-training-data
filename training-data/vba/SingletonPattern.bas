' Class module: AppConfig
Public Settings As String

' Standard module holding the singleton accessor
Dim configInstance As AppConfig

Function GetConfig() As AppConfig
    If configInstance Is Nothing Then
        Set configInstance = New AppConfig
        configInstance.Settings = "default"
    End If
    Set GetConfig = configInstance
End Function

Sub Main()
    Dim first As AppConfig
    Dim second As AppConfig

    Set first = GetConfig()
    first.Settings = "production"

    Set second = GetConfig()
    Debug.Print second.Settings
    Debug.Print (first Is second)
End Sub
