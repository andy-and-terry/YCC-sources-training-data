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
