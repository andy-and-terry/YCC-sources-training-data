using System;
using System.Collections.Generic;

interface ICommand
{
    void Execute();
    void Undo();
}

class Light
{
    public bool On;
}

class TurnOnCommand : ICommand
{
    private readonly Light light;
    public TurnOnCommand(Light light) => this.light = light;
    public void Execute() => light.On = true;
    public void Undo() => light.On = false;
}

class CommandHistory
{
    private readonly Stack<ICommand> history = new();

    public void Execute(ICommand command)
    {
        command.Execute();
        history.Push(command);
    }

    public void UndoLast()
    {
        if (history.Count > 0) history.Pop().Undo();
    }

    static void Main()
    {
        var light = new Light();
        var history = new CommandHistory();
        history.Execute(new TurnOnCommand(light));
        Console.WriteLine(light.On);
        history.UndoLast();
        Console.WriteLine(light.On);
    }
}
