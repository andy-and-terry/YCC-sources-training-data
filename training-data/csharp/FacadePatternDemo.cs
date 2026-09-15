using System;

class CpuUnit
{
    public void Freeze() => Console.WriteLine("CPU: freeze");
    public void Jump(long position) => Console.WriteLine($"CPU: jump to {position}");
    public void Execute() => Console.WriteLine("CPU: execute");
}

class Memory
{
    public void Load(long position, string data) => Console.WriteLine($"Memory: load '{data}' at {position}");
}

class HardDrive
{
    public string Read(long lba, int size) => $"data[{lba}:{size}]";
}

class ComputerFacade
{
    private readonly CpuUnit cpu = new();
    private readonly Memory memory = new();
    private readonly HardDrive drive = new();

    public void Start()
    {
        cpu.Freeze();
        memory.Load(0, drive.Read(0, 1024));
        cpu.Jump(0);
        cpu.Execute();
    }
}

class FacadePatternDemo
{
    static void Main()
    {
        var computer = new ComputerFacade();
        computer.Start();
    }
}
