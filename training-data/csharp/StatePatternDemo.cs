using System;

interface ITrafficLightState
{
    ITrafficLightState Next();
    string Name { get; }
}

class RedState : ITrafficLightState
{
    public string Name => "Red";
    public ITrafficLightState Next() => new GreenState();
}

class GreenState : ITrafficLightState
{
    public string Name => "Green";
    public ITrafficLightState Next() => new YellowState();
}

class YellowState : ITrafficLightState
{
    public string Name => "Yellow";
    public ITrafficLightState Next() => new RedState();
}

class TrafficLight
{
    private ITrafficLightState state = new RedState();

    public void Advance() => state = state.Next();
    public string CurrentState => state.Name;
}

class StatePatternDemo
{
    static void Main()
    {
        var light = new TrafficLight();
        for (int i = 0; i < 5; i++)
        {
            Console.WriteLine(light.CurrentState);
            light.Advance();
        }
    }
}
