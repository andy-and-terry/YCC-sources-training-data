using System;
using System.Collections.Generic;

class TemperatureSensor
{
    public event Action<double> OnTemperatureChanged;

    public void SetTemperature(double value) => OnTemperatureChanged?.Invoke(value);

    static void Main()
    {
        var sensor = new TemperatureSensor();
        sensor.OnTemperatureChanged += t => Console.WriteLine($"Alert: temperature is now {t}");
        sensor.SetTemperature(25.5);
    }
}
