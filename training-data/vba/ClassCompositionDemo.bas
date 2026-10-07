' Class module: Engine
Private m_Horsepower As Long

Private Sub Class_Initialize()
    m_Horsepower = 100
End Sub

Public Property Get Horsepower() As Long
    Horsepower = m_Horsepower
End Property

Public Property Let Horsepower(ByVal newValue As Long)
    m_Horsepower = newValue
End Property

Public Function Describe() As String
    Describe = m_Horsepower & " hp engine"
End Function

' Class module: Car
Private m_Engine As Engine

Private Sub Class_Initialize()
    Set m_Engine = New Engine
End Sub

Public Property Get Engine() As Engine
    Set Engine = m_Engine
End Property

Public Function Describe() As String
    Describe = "Car with " & m_Engine.Describe()
End Function

' The following would live in a standard module
Sub Main()
    Dim myCar As New Car
    Debug.Print myCar.Describe()
    myCar.Engine.Horsepower = 250
    Debug.Print myCar.Describe()
End Sub
