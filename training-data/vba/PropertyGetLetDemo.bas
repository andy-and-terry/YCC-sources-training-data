' Class module: Temperature
Private mCelsius As Double

Public Property Get Celsius() As Double
    Celsius = mCelsius
End Property

Public Property Let Celsius(ByVal value As Double)
    mCelsius = value
End Property

Public Property Get Fahrenheit() As Double
    Fahrenheit = mCelsius * 9# / 5# + 32#
End Property

Public Property Let Fahrenheit(ByVal value As Double)
    mCelsius = (value - 32#) * 5# / 9#
End Property

' --- Standard module (references the Temperature class module above) ---
Sub Main()
    Dim t As New Temperature
    t.Celsius = 0
    Debug.Print t.Celsius, t.Fahrenheit

    t.Fahrenheit = 212
    Debug.Print t.Celsius, t.Fahrenheit
End Sub
