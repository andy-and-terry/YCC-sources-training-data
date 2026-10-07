' Class module: Thermostat
Public Event TemperatureChanged(ByVal newTemp As Double)

Private m_Temperature As Double

Public Property Get Temperature() As Double
    Temperature = m_Temperature
End Property

Public Property Let Temperature(ByVal newValue As Double)
    m_Temperature = newValue
    RaiseEvent TemperatureChanged(newValue)
End Property

' The following would live in a standard module
Private WithEvents m_Thermostat As Thermostat

Private Sub m_Thermostat_TemperatureChanged(ByVal newTemp As Double)
    Debug.Print "temperature changed to " & newTemp
End Sub

Sub Main()
    Set m_Thermostat = New Thermostat
    m_Thermostat.Temperature = 21.5
    m_Thermostat.Temperature = 19
End Sub
