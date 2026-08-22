using System;

class StockTicker
{
    public event EventHandler<double> PriceChanged;

    private double price;
    public double Price
    {
        get => price;
        set
        {
            price = value;
            PriceChanged?.Invoke(this, value);
        }
    }
}

class EventDelegatePattern
{
    static void Main()
    {
        var ticker = new StockTicker();
        ticker.PriceChanged += (sender, price) => Console.WriteLine($"price changed to {price}");
        ticker.Price = 100.5;
        ticker.Price = 102.3;
    }
}
