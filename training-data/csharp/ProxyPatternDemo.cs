using System;

interface IImage
{
    void Display();
}

class RealImage : IImage
{
    private readonly string filename;

    public RealImage(string filename)
    {
        this.filename = filename;
        LoadFromDisk();
    }

    private void LoadFromDisk() => Console.WriteLine($"Loading {filename} from disk.");

    public void Display() => Console.WriteLine($"Displaying {filename}.");
}

class ProxyImage : IImage
{
    private readonly string filename;
    private RealImage? realImage;

    public ProxyImage(string filename) => this.filename = filename;

    public void Display()
    {
        realImage ??= new RealImage(filename);
        realImage.Display();
    }
}

class ProxyPatternDemo
{
    static void Main()
    {
        IImage image = new ProxyImage("photo.png");
        Console.WriteLine("Proxy created, image not loaded yet.");
        image.Display();
        image.Display();
    }
}
